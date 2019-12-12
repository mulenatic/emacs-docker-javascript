# Use the newest emacs version from silex as base
FROM mulenatic/emacs-docker:v2.1
RUN sudo apt-get update; sudo apt-get install -y default-jdk maven; sudo rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*;
COPY ["emacs.el", "/home/docker/.emacs.el"]
USER docker
RUN echo '\n(depends-on "yasnippet")\n(depends-on "lsp-mode")\n(depends-on "hydra")\n(depends-on "company-lsp")\n(depends-on "lsp-ui")\n(depends-on "lsp-java")\n(depends-on "dap-mode")\n(depends-on "dap-java")\n(depends-on "helm-lsp")\n(depends-on "lsp-treemacs")\n(depends-on "treemacs-projectile")\n(depends-on "treemacs-magit")\n(depends-on "restclient")\n(depends-on "company-restclient")' >> /home/docker/.emacs.d/Cask; \
	cd /home/docker/.emacs.d/; cask install; \
	sudo chown -R docker /home/docker; \
	echo '(lsp-treemacs-sync-mode 1)' >> /home/docker/.emacs.el;
RUN mkdir /home/docker/jdt; cd /home/docker/jdt; \
	curl https://raw.githubusercontent.com/emacs-lsp/lsp-java/master/install/pom.xml --output pom.xml; \
	/usr/bin/mvn -Djdt.js.server.root=/home/docker/.emacs.d/eclipse.jdt.ls/server/ -Djunit.runner.root=/home/docker/.emacs.d/eclipse.jdt.ls/test-runner/ -Djunit.runner.fileName=junit-platform-console-standalone.jar -Djava.debug.root=/home/docker/.emacs.d/eclipse.jdt.ls/server/bundles clean package -Djdt.download.url=https://download.eclipse.org/jdtls/snapshots/jdt-language-server-latest.tar.gz; \
	rm -rf ~/jdt/;
	#sed -i 's/#TestAddons/echo "Testing if docker.sock file is present";\nif [ -f \/var\/run\/docker.sock ]; \nthen \necho "The hosts docker.sock file has not been mounted into the container. Please start the container with \"-v \/var\/run\/docker.sock:\/var\/run\/docker.sock\".";\n exit 1;\nfi;\n#TestAddons/g' /home/docker/startup.sh; \
	#sed -i 's/#scriptAddons/sudo chgrp docker \/var\/run\/docker.sock;\n\n#scriptAddons/g' /home/docker/startup.sh; 

