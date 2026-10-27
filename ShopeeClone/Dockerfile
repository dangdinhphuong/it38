# Stage 1: Build & Publish
FROM mcr.microsoft.com/dotnet/sdk:10.0 AS build
WORKDIR /src

# Tận dụng cache của Docker layer: copy file .csproj và chạy dotnet restore trước
COPY ShopeeClone.csproj ./
RUN dotnet restore "ShopeeClone.csproj"

# Copy toàn bộ mã nguồn còn lại và publish ứng dụng
COPY . ./
RUN dotnet publish "ShopeeClone.csproj" -c Release -o /app/publish /p:UseAppHost=false

# Stage 2: Runtime
FROM mcr.microsoft.com/dotnet/aspnet:10.0 AS runtime
WORKDIR /app

# Copy sản phẩm đã publish từ stage build sang stage runtime
COPY --from=build /app/publish ./

# Expose cổng ứng dụng
EXPOSE 5017

# Lệnh khởi chạy ứng dụng
ENTRYPOINT ["dotnet", "ShopeeClone.dll"]

