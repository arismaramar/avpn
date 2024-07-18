package main

import (
	"bufio"
	"fmt"
	"log"
	"net/http"
	"os"
	"strings"
	"time"
)

func main() {
	// Mendapatkan alamat IP publik
	myIP := getMyIP()

	// Mengatur username dan masa berlaku dari file eksternal
	setUserAndExpiration(myIP)

	// Mendapatkan data untuk menampilkan informasi sistem
	systemInfo := getSystemInfo()

	// Menghitung jumlah akun untuk setiap jenis
	vme := countAccounts("/etc/xray/vme.json", "#vme-user# ")
	vle := countAccounts("/etc/xray/vle.json", "#vle-user# ")
	tro := countAccounts("/etc/xray/tro.json", "#tro-user# ")
	ssr := countAccounts("/etc/xray/ssr.json", "#ssr-user# ")
	nob := countAccounts("/etc/noobzvpns/.noobzvpns", "#nob# ")
	ssh := countAccounts("/etc/ssh/.ssh.db", "#ssh# ")

	// Menampilkan banner, informasi sistem, daftar akun, dan opsi akses
	lunaticBanner()
	fmt.Println(systemInfo)
	fmt.Printf("\x1b[38;5;162m             \x1b[0;35mSSH : %d VLESS : %d VMESS : %d \x1b[0m\n", ssh, vle, vme)
	fmt.Printf("\x1b[38;5;162m             \x1b[0;36mTRO : %d NOOBZ : %d SDWSK : %d \x1b[0m\n", tro, nob, ssr)
	accessUseCommand()
}

func getMyIP() string {
	resp, err := http.Get("https://ipv4.icanhazip.com")
	if err != nil {
		log.Fatal(err)
	}
	defer resp.Body.Close()

	ipBytes := make([]byte, 16)
	n, err := resp.Body.Read(ipBytes)
	if err != nil {
		log.Fatal(err)
	}

	return strings.TrimSpace(string(ipBytes[:n]))
}

func setUserAndExpiration(ip string) {
	resp, err := http.Get("https://raw.githubusercontent.com/lunatixmyscript/lunaip/main/ip")
	if err != nil {
		log.Fatal(err)
	}
	defer resp.Body.Close()

	scanner := bufio.NewScanner(resp.Body)
	for scanner.Scan() {
		line := scanner.Text()
		fields := strings.Fields(line)
		if len(fields) >= 3 && fields[1] == ip {
			err := ioutil.WriteFile("/usr/bin/user", []byte(fields[1]), 0644)
			if err != nil {
				log.Fatal(err)
			}
			err = ioutil.WriteFile("/usr/bin/e", []byte(fields[2]), 0644)
			if err != nil {
				log.Fatal(err)
			}
			break
		}
	}
	if err := scanner.Err(); err != nil {
		log.Fatal(err)
	}
}

func getSystemInfo() string {
	system := ""
	system += "\x1b[38;5;162m       ┌━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┐\033[0m\n"
	system += "\x1b[38;5;162m       │\x1b[38;5;196m SYSTEM : \x1b[31m" + getOS() + "     \033[0m\n"
	system += "\x1b[38;5;162m       │\x1b[38;5;196m RAM : \x1b[31m" + getRAM() + " MB   \033[0m\n"
	system += "\x1b[38;5;162m       │\x1b[38;5;196m UPTIME : \x1b[31m" + getUptime() + "\033[0m\n"
	system += "\x1b[38;5;162m       │\x1b[38;5;196m IPVPS : \x1b[31m" + getMyIP() + "     \033[0m\n"
	system += "\x1b[38;5;162m       │\x1b[38;5;196m ISP : \x1b[31m" + getISP() + "    \033[0m\n"
	system += "\x1b[38;5;162m       │\x1b[38;5;196m DOMAIN : \x1b[31m" + getDomain() + "    \033[0m\n"
	system += "\x1b[38;5;162m       └━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┘\033[0m\n"
	system += "\x1b[38;5;162m            ┌━━━━━━━━━━━━━━━━━━━━━━━━━━━┐\033[0m\n"
	system += "\x1b[38;5;162m            │\x1b[37;1m ID :\x1b[92;1m " + getUsername() + "\n"
	system += "\x1b[38;5;162m            │\x1b[37;1m Exp.Sc :\x1b[92;1m " + getExpiration() + ".Turn\033[0m\n"
	system += "\x1b[38;5;162m            │\x1b[37;1m Sc.Version :\x1b[92;1m 4.4.4 Lt.\033[0m\n"
	system += "\x1b[38;5;162m            └━━━━━━━━━━━━━━━━━━━━━━━━━━━┘\033[0m\n"
	return system
}

func getUsername() string {
	username, err := ioutil.ReadFile("/usr/bin/user")
	if err != nil {
		log.Fatal(err)
	}
	return string(username)
}

func getExpiration() string {
	exp, err := ioutil.ReadFile("/usr/bin/e")
	if err != nil {
		log.Fatal(err)
	}
	expTime, _ := time.Parse("2006-01-02", strings.TrimSpace(string(exp)))
	daysLeft := int(expTime.Sub(time.Now()).Hours() / 24)
	return fmt.Sprintf("%d", daysLeft)
}

func countAccounts(filename, prefix string) int {
	file, err := os.Open(filename)
	if err != nil {
		return 0
	}
	defer file.Close()

	seen := make(map[string]bool)
	count := 0
	scanner := bufio.NewScanner(file)
	for scanner.Scan() {
		line := scanner.Text()
		if strings.HasPrefix(line, prefix) {
			account := strings.Fields(line)[1]
			if !seen[account] {
				seen[account] = true
				count++
			}
		}
	}
	return count
}