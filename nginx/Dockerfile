FROM nginx:1.25.3

# copy custom nginx configuration
COPY ./nginx.conf /etc/nginx/

# copy data to predefined location
COPY ./data/static.json /data/json/

EXPOSE 5000

# run the nginx without halting docker
CMD [ "nginx", "-g", "daemon off;" ]
