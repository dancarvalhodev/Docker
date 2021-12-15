# Docker LAMP Stack

#### A basic LAMP stack built using Docker Engine.

**Only run `docker-compose up -d` and you're ready to work**

---

# Stack Version
- PHP 8.0.x (easily interchangeable in DockerFile, changing the first line).
- MySQL 5.7.36
- Apache
- Built using Debian 11

---

# Tips
## Give apache write permition and local user same permition
`find /var/www -type d -exec chmod a+rwx,o-rwx,ug+s {} +` **(Inside Container)**
`sudo chown -R dan:www-data src/` **(Into docker folder all data into src folder)**