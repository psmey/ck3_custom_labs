FROM node:22.15.1

RUN npm install --global prettier@3.5.3

ENTRYPOINT ["prettier", "/github/workspace", "--check"]
