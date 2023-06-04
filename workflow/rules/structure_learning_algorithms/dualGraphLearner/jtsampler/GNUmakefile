
CLASSDEST=$(HOME)/Classes
JBIN=/usr/bin
JAVAC = $(JBIN)/javac -Xlint:-deprecation -Xlint:-fallthrough -Xlint:-unchecked -O

.SUFFIXES: .java, .class
.PRECIOUS: %.class
CLASSES := $(shell pwd )

JAVAFILES := $(shell find . -name "*.java" -print | grep -v MISC | grep -v misc)
ALLOBJS := $(shell find . -name "*.class" -print)
ALLOBJS1 := $(shell find . -maxdepth 1 -name "*.class" -print)
OBJS = $(JAVAFILES:%.java=%.class)
MAINS := $(shell echo *.java)
COBJS = $(MAINS:%.java=%.class)


all	: $(COBJS) $(OBJS) 

clean	:
	/bin/rm -f $(ALLOBJS1)

allclean:
	rm -f $(ALLOBJS)
	/bin/rm -f `find . -name "*.class"`

git:
	# 	To update the current version
	# git status 			to check whether files need updating
	#
	# git add .			to add the current files to git watching
	# or
	# git add [filename]
	# git commit -m "comment"	to make the current files the current version
	# git push			to push the local version to the git web site
	#
	# or
	# git commit -a -m "comment" 	to add and commit in the same command
	# git push			to push the version to the web site
	#
	# git pull			to pull the web site version to the local version	


gitinit:
	#	Make the jtsampler.jar file in src/java/packaging
	#	Then do the following
	#	jar -xvf /home/alun/src/java/packaging/jtsampler.jar 
	#	git config  user.email alun.thomas@utah.edu
	#	git commit -m "committing existing source code"
	#	git branch -M main
	#	git push -u origin main
	

.java.class:
	$(JAVAC) -classpath $(CLASSES) $<

%.class: %.java
	$(JAVAC) -classpath $(CLASSES) $<

