variable "vm_name_prefix" {
  type        = string
  description = "Префикс для имен ВМ и сети"
  default     = "my-project"
}

variable "zone" {
  type        = string
  description = "Зона доступности"
  default     = "ru-central1-a"
}

variable "preemptible" {
  type        = bool
  description = "Флаг прерываемой ВМ"
  default     = false
}

variable "ssh_public_key" {
  type        = string
  description = "Путь к публичному SSH-ключу"
  default     = "~/.ssh/id_rsa.pub"
}

# Переменные для образов (family из консоли Yandex Cloud)
variable "ubuntu_image_family" {
  type        = string
  description = "Семейство образа Ubuntu"
  default     = "ubuntu-2204-lts"
}

variable "debian_image_family" {
  type        = string
  description = "Семейство образа Debian"
  default     = "debian-12"
}

# Пользователи по умолчанию для этих ОС
variable "ubuntu_user" {
  type        = string
  default     = "ubuntu"
}

variable "debian_user" {
  type        = string
  default     = "debian"
}
variable "sa_key_file" {
  type        = string
  description = "Путь к файлу ключа сервисного аккаунта (JSON)"
  default     = "./key.json"
}

variable "cloud_id" {
  type        = string
  description = "Идентификатор облака в Yandex Cloud"
}

variable "folder_id" {
  type        = string
  description = "Идентификатор каталога (folder) в Yandex Cloud"
}

variable "ssh_private_key" {
  description = "Путь к приватному SSH-ключу для подключения к ВМ"
  type        = string
  default     = "~/.ssh/id_rsa"
}