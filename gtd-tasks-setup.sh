
task config uda.gtd.label "GTD Type"
task config uda.gtd.type string
task config uda.gtd.values "inbox,action,awaiting,maybe"
task config uda.gtd.default inbox

task config report.inbox.description "Inbox"
task config report.inbox.columns "id,description"
task config report.inbox.Labels "Id,Description"
task config report.inbox.filter "gtd:inbox +PENDING"

task config report.next.description "Next Actions"
task config report.next.columns "gtd,id,due,project,tags,description"
task config report.next.labels "GTD,Id,Due,Project,Tags,Description"
task config report.next.sort "due+"
task config report.next.filter "gtd:action -BLOCKED +PENDING"

task config report.waiting.description "Waiting For"
task config report.waiting.columns "id,due,project,tags,description"
task config report.waiting.labels "Id,Due,Project,Tags,Description"
task config report.waiting.sort "due+"
task config report.waiting.filter "gtd:awaiting -BLOCKED +PENDING"

task config report.maybe.description "Maybe"
task config report.maybe.columns "id,due,project,tags,description"
task config report.maybe.labels "Id,Due,Project,Tags,Description"
task config report.maybe.sort "due+"
task config report.maybe.filter "gtd:maybe -BLOCKED +PENDING"

rm .gtdtaskrc 2> /dev/null
touch .gtdtaskrc
echo "alias tin=\"task gtd:inbox add\"" >> .gtdtaskrc
echo "alias tdo=\"task gtd:action add\"" >> .gtdtaskrc
echo "alias twait=\"task gtd:awaiting add\"" >> .gtdtaskrc
echo "alias tmaybe=\"task gtd:maybe add\"" >> .gtdtaskrc
