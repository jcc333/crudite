# CRDTMacs

A collaborative, highly-concurrent editor.

## Installation

```sh
npm install
```

## Build

- Build: `npm run res:build`
- Clean: `npm run res:clean`
- Build & watch: `npm run res:dev`

## Run

`npm run run`, or,

```sh
node src/Demo.bs.js
```

## Design

### Sessions

The log and local resources to edit text.
Associated with a user and a host.

- Every instance of CRDTMacs has a Session.
- A Session has 0+ windows.
- A Session has 1+ buffers.

### Windows

A view on a Session.
- A Window has one session.
- A Window has one medium.
- A Window has 1+ sashes.


### Media

How the Window is displayed.

#### Console

A console-text-editing window, _a la_ Emacs or Vim

#### Debug Log

A log of all of the decoded commands

#### GUI

An OS-level windowed representation

### Sashes

Splits in the window, little bottom-line command outputs etc.

- A Sash has one Window
- A Sash has one Buffer

### Buffers

Views on text or processes.

Buffers in the emacs sense of the term.

- A Buffer has 0+ Sashes
- A Buffer has 1 Session

### Agents

Lil' Guys.

Agents are thread or OS process or remote goings on which submit commands.

They might be REPL-like over a python or ruby interpreter or bash, taking their own commands.

They might be "search", creating a new buffer of search outputs.

- An Agent has one Session
- An Agent has 0+ Buffers

## Queue

- Debug Log Agent
- Console Medium
- Window API
- Command Routing Server (is it just in-process redis? is an editor just a background jobs server?)
