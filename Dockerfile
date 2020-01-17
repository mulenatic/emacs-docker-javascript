# Use the newest emacs version from silex as base
FROM mulenatic/emacs-docker:v2.1.3
RUN curl -sL https://deb.nodesource.com/setup_13.x | sudo -E bash -; sudo apt-get update; sudo apt-get install -y nodejs; sudo npm i -g typescript-language-server; sudo npm i -g typescript eslint eslint-loader eslint-plugin-react eslint-plugin-smarter-tabs; sudo rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*;
USER docker
COPY ["emacs.el", "/home/docker/emacs-addons.el"]
RUN cat /home/docker/emacs-addons.el >> /home/docker/.emacs.el
RUN echo '\n(depends-on "yasnippet")\n(depends-on "lsp-mode")\n(depends-on "hydra")\n(depends-on "company-lsp")\n(depends-on "lsp-ui")\n(depends-on "helm-lsp")\n(depends-on "lsp-treemacs")\n(depends-on "treemacs-projectile")\n(depends-on "treemacs-magit")\n(depends-on "restclient")\n(depends-on "company-restclient")\n(depends-on "react-snippets")' >> /home/docker/.emacs.d/Cask; \
	cd /home/docker/.emacs.d/; cask install; \
	sudo chown -R docker /home/docker; \
	echo '(lsp-treemacs-sync-mode 1)' >> /home/docker/.emacs.el;

