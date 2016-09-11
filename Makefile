
TOMCAT_VERSION_MAJOR=8
TOMCAT_VERSION_MINOR=0
TOMCAT_VERSION_BUILD=37

.DEFAULT_GOAL := build

clean:
	-docker rmi amarkwalder/cdk-tomcat:${TOMCAT_VERSION_MAJOR}.${TOMCAT_VERSION_MINOR}.${TOMCAT_VERSION_BUILD}
	-docker rmi amarkwalder/cdk-tomcat:${TOMCAT_VERSION_MAJOR}
	-docker rmi amarkwalder/cdk-tomcat:latest
.PHONY: clean

build:
	docker build \
		-t amarkwalder/cdk-tomcat:${TOMCAT_VERSION_MAJOR}.${TOMCAT_VERSION_MINOR}.${TOMCAT_VERSION_BUILD} \
		-t amarkwalder/cdk-tomcat:${TOMCAT_VERSION_MAJOR} \
		.
.PHONY: build

tag:
	docker pull amarkwalder/cdk-tomcat:${TOMCAT_VERSION_MAJOR}.${TOMCAT_VERSION_MINOR}.${TOMCAT_VERSION_BUILD}
	docker tag amarkwalder/cdk-tomcat:${TOMCAT_VERSION_MAJOR}.${TOMCAT_VERSION_MINOR}.${TOMCAT_VERSION_BUILD} amarkwalder/cdk-tomcat:${TOMCAT_VERSION_MAJOR}
	docker push amarkwalder/cdk-tomcat:${TOMCAT_VERSION_MAJOR}
	docker tag amarkwalder/cdk-tomcat:${TOMCAT_VERSION_MAJOR}.${TOMCAT_VERSION_MINOR}.${TOMCAT_VERSION_BUILD} amarkwalder/cdk-tomcat:latest
	docker push amarkwalder/cdk-tomcat:latest
.PHONY: tag

run: build
	docker run -it --rm amarkwalder/cdk-tomcat:${TOMCAT_VERSION_MAJOR}
.PHONY: run
