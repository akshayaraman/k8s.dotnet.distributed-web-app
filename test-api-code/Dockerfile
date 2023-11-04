# build stage
FROM mcr.microsoft.com/dotnet/sdk:3.1 As build

WORKDIR /source

# copy source code to the working directory
COPY . .

# restores the dependencies
RUN dotnet restore "./TestApi/TestApi.csproj"

# publish the project
RUN dotnet publish "./TestApi/TestApi.csproj" --output /app --no-restore

# production stage
FROM mcr.microsoft.com/dotnet/sdk:3.1

WORKDIR /app

# host addresses with ports and protocols that the server should listen on for requests
# https://learn.microsoft.com/en-us/aspnet/core/fundamentals/host/web-host?view=aspnetcore-3.1#server-urls-2
ENV ASPNETCORE_URLS="http://*:5000"

# copy binary from previous stage to the current stage
COPY --from=build /app .

ENTRYPOINT [ "dotnet", "TestApi.dll" ]