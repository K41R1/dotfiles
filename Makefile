.PHONY: i3 install system installdev installi3 installframeworks

stow = cd config && stow -v -t ~
YAY_FLAGS = --noconfirm --needed -S

install:
	xargs -d '\n' -a packages/package.list yay $(YAY_FLAGS)

installi3: install
	xargs -d '\n' -a packages/i3.list yay $(YAY_FLAGS)

installdev: install
	xargs -d '\n' -a packages/dev.list yay $(YAY_FLAGS)

system:
	$(stow) Xresources
	$(stow) vim
i3:
	$(stow) i3
	$(stow) polybar
	$(stow) neofetch
	$(stow) rofi