FROM ubuntu:22.04

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y sudo

RUN sudo apt-get install -y build-essential

RUN sudo apt-get install -y curl

# Install .NET Core SDK
RUN curl -sSL https://dot.net/v1/dotnet-install.sh | bash /dev/stdin --channel LTS --install-dir /usr/share/dotnet

# Add .NET Core CLI tools to PATH
ENV PATH="${PATH}:/usr/share/dotnet"

# Install necessary libraries for .NET Core runtime
RUN sudo apt-get install -y libc6 libgcc1 libgssapi-krb5-2 libicu-dev libssl-dev libstdc++6 zlib1g

# Set up a non-root user
RUN adduser --gecos '' jezper
RUN echo jezper:admin | chpasswd
RUN usermod -aG sudo jezper

USER jezper

# Test .NET Core installation
RUN dotnet --info
