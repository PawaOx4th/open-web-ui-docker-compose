FROM n8nio/n8n:latest
USER root

RUN npm install -g axios  \
  date-fns \
  uuid \
  slackify-markdown


USER node