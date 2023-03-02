## Installation WSL 2

### Activer le sous système linux

- Activer la VMP (Virtual Machine Platform)
```shell
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all
```
- Redémarrer la machine

### Passer de WSL 1 à WSL 2

Lancer la commande dans le Powershell en administrateur:
```shell
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all
```
- Redémarrer la machine


### Installation Ubuntu 22.04

- Allez dans store
- Télécharger Ubuntu 22.04

### Activer WSL 2 par default
```shell
wsl --set-default-version 2
```

- Vérifiersi vos linux embarqués dans Windows sont bien en WSl 2
```shell
wsl --list --verbose
```

