# Оболочка для запуска бинарников Ryujinx

Для запуска необходим пакет nix-ld

Поместить файл shell.nix рядом с Ryujinx, выполнить команду
```bash
nix-shell
```

## Если Ryujinx не видит контроллер
Добавить в /etc/nixos/configuration.nix

```nix
services.udev = {
    packages = with pkgs; [
        game-devices-udev-rules
    ];
};
hardware.uinput.enable = true;
```