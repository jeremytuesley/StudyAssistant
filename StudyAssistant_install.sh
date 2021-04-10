#!/bin/bash

if [ -e StudyAssistant.sh ]; then
echo "StudyAssistant has already been installed, please run the Application file (StudyAssistant.sh) instead"
else
echo "Preperaring directories for installation..."
bundle install
touch StudyAssistant.sh
chmod u+x StudyAssistant.sh
echo "#!/bin/bash" >> StudyAssistant.sh
echo "cd src" >> StudyAssistant.sh
echo "ruby main.rb" >> StudyAssistant.sh
echo "Launching Study Assistant..."
cd src
ruby main.rb --help
fi
