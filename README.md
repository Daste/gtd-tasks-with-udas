# GTD-TASKS-WITH-UDAS

This project is a small configuration for taskwarrior implementing a gtd-like workflow I made for personal use. 

I advise against using it unless you understand exactly what it does as it can be annoying to troubleshoot and can somewhat mess up your taskwarrior database. 

## Syntetic description of GTD:

Prompts to do something, called "stuff", are incontered troughout the day. 
They should be captured in a trusted system, called "inbox", without much thought.

The imbox should be frequently processed, and the stuff should be either:
- deleted if it is not relevant
- delegated if it is not your responsibility
- done if it takes less than 2 minutes
- deferred if it is not relevant now
- added to a project if it is a multi-step task
- added to a next action list if it is a single-step task
- moved into a "someday/maybe" list if it is not relevant now but might be in the future
- moved to file storage if it constitutes relevant information but not a required action

## Interpretation of GTD in task warrior primitives:

### Data management
We introduce a user defined attribute (UDA) called "gtd-type" with the following values:
- ```inbox```
- ```action```
- ```awaiting```
- ```maybe```

project are handled with the built in project attribute

deferral is handled with the built in scheduled attribute

dependency between tasks is handled with the built in depends attribute

awaiting represents an external event we are waiting for, like an email reply or a package delivery, so that other task might be blocked by it
maybe represents a task that is not relevant now but might be in the future

We dont implement a storage system.

### Reports
The ```inbox``` report shows all the tasks with gtd-type:inbox

The ```next``` report is customized to show only unblocked tasks  with gtd-type:action and after their scheduled date

The ```awaiting``` report shows all the tasks with gtd-type:awaiting

The ```maybe``` report shows all the tasks with gtd-type:maybe
### Commands
The ```tin``` command is a wrapper around the add command that sets the gtd-type:inbox attribute

The ```tdo``` command is a wrapper around the add command that sets the gtd-type:action attribute

The ```twait``` command is a wrapper around the add command that sets the gtd-type:awaiting attribute

The ```tmaybe``` command is a wrapper around the add command that sets the gtd-type:maybe attribute

## Installation
Add the following lines to your .bashrc file in the home directory:
```bash
### add gtd-tasks aliases to add tasks to the inbox, action, waiting, and maybe lists
if [ -f ~/.gtdtaskrc ]; then
    . ~/.gtdtaskrc
fi
```

Then run the script [gtd-tasks-setup.sh](gtd-tasks-setup.sh) (or copy it into a shell terminal).

## Disclaimer
This is a personal project, published as-is, with no warranty whatsoever. Use at your own risk. Copy, modify, and redistribute at will, no attribution required.


