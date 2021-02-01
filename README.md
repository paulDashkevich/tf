# tf - первый скрипт
По заданию требовалось раскатать серв с установленным Nginx через ansible.
1. Выполнение начинается с установки на локальную машину самого терраформа и ансибла
* `yum install -y yum-utils`
* `curl -fsSL https://apt.releases.hashicorp.com/gpg | key add -`
* `sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo`
* `yum -y install terraform`
* `yum install -y epel-release`
* `yum install ansible`
2. Создание файла main.tf - в нём описываем провайдеров для работы с хостером и ансиблом.
3. Настраиваем ансибл для работы с сервером, включая адрес сервера в файл хостов ансибла
`vi /etc/ansible/hosts` - добавляем ip-адрес сервера в этот файл
4. Создаём плэйбук для nginx и перед отправкой на исполнение проверяем локально
`ansible-playbook --syntax-check ./provision/playbook.yml` ошибок нет и можем стартовать
5. Запускаем скрипт 
`terraform apply` и смотрим, как раскатывается сервер. 
6. По ip сервера заходим и наблюдаем, что Nginx отрабатывает стартовую страницу
