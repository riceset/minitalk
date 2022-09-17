<h1 align="center">
	minitalk
</h1>

## Summary

> The purpose of this project is to code a small data exchange program
> using UNIX signals.

## Getting started

First, clone this repository and `cd` into it:

```zsh
$ git clone https://github.com/riceset/minitalk; cd minitalk
```

As this project uses the `libft` you will have to clone it on the root of the repository as well:

```zsh
$ git clone https://github.com/riceset/libft
```

Compile the executable files with:

```zsh
$ make
```

You can also compile the files for the server or the client individually:

```zsh
$ make server
```

```zsh
$ make client
```

## Usage

First, start up the server and it will print a PID:

```zsh
$ ./server
```

Now you can pass the PID of the server to the client as a command line argument with the message you wish to send:

```zsh
$ ./client PID "Hello World"
```
