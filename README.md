# GTD-TASKS-WITH-UDAS

This project implements a GTD workflow in task warrior. It differs from commonly used implementations by using UDA's

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

## Interpretation of GTD in task warrior primitives:

### Data management
We introduce a user defined attribute (UDA) called "gtd-type" with the following values:
- inbox
- action
- waiting-for

project are handled with the built in project attribute
deferral is handled with the built in scheduled attribute
dependency between tasks is handled with the built in depends attribute
waiting-for represents an external event we are waiting for, like an email reply or a package delivery, so that other task might be blocked by it
### Reports
The inbox report shows all the tasks with gtd-type:inbox
The next report is customized to show only unblocked tasks with gtd-type:action
The waiting-for report shows all the tasks with gtd-type:waiting-for
### Commands
The tin command is a wrapper around the add command that sets the gtd-type:inbox attribute
The tdo command is a wrapper around the add command that sets the gtd-type:action attribute
The twait command is a wrapper around the add command that sets the gtd-type:waiting-for attribute


