# Use the newest emacs version from silex as base
FROM mulenatic/emacs-docker
USER docker
RUN echo '(depends-on "lsp-java")' >> /home/docker/.emacs.d/Cask; \
	cd /home/docker/.emacs.d/; cask install;
	#sed -i 's/#TestAddons/echo "Testing if docker.sock file is present";\nif [ -f \/var\/run\/docker.sock ]; \nthen \necho "The hosts docker.sock file has not been mounted into the container. Please start the container with \"-v \/var\/run\/docker.sock:\/var\/run\/docker.sock\".";\n exit 1;\nfi;\n#TestAddons/g' /home/docker/startup.sh; \
	#sed -i 's/#scriptAddons/sudo chgrp docker \/var\/run\/docker.sock;\n\n#scriptAddons/g' /home/docker/startup.sh; 

