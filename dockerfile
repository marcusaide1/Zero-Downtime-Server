# STAGE 1: Build the Go binary
FROM golang:1.21-alpine AS builder
WORKDIR /app
# Copy go.mod and sum first (optimizes Docker caching)
COPY go.mod go.sum ./
RUN go mod download
# Copy the rest of the code and build
COPY . .
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o main main.go

# STAGE 2: Create the final lean image
FROM alpine:latest
WORKDIR /root/
# Copy only the compiled binary from the builder stage
COPY --from=builder /app/main .
# Expose the port (e.g., 8080)
EXPOSE 8080
# Run the app
CMD ["./main"]
