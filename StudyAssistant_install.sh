#!/bin/bash

if [ -e StudyAssistant.sh ]; then
echo "StudyAssistant has already been installed, please run the Application file (StudyAssistant.sh) instead"
else
echo "Preperaring directories for installation..."
bundle install
touch StudyAssistant.sh
chmod u+x StudyAssistant.sh
echo "#!/bin/bash" >> StudyAssistant.sh
echo "ruby ./src/main.rb" >> StudyAssistant.sh
echo "Launching Study Assistant..."
ruby ./src/main.rb --help
fi
