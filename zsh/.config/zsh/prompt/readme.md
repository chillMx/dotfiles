# Purification

![purification is beautiful](./screenshot.png)

> Purity purified by purification - even more minimal and fast Zsh prompt

## Overview

Most prompts are cluttered, ugly and slow. I'm not sure mine is better, but I like it anyway!

### Why?

* I needed some `git` infos to remind me where the heck is my code? Oh yeah my stash is full.
* I don't like cluttered Zsh frameworks anymore. I needed something without any dependency I could modify myself easily when I'm bored.
* I included the Greek lambda letter to represent a branch, to remind me that everything can be build from Lambda expressions, and that Half-Life is a great game.

## Install

0. You need [font awesome 4](https://fontawesome.com/v4.7.0/) to display the cool `git` infos signs. I know, I said "without dependencies". You can still change it.
1. Download `prompt_purification_setup` in a folder.
2. Add the folder path in your fpath (in your `zshrc`): `fpath=(/the/folder/where/there/is/the/prompt $fpath)`
3. Autoload it in your `zshrc`: `autoload -Uz prompt_purification_setup && prompt_purification_setup`

## License

[MIT](http://opensource.org/licenses/MIT)
