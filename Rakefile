
version = ENV['VERSION'] || '0.24.1'
arch = ENV['ARCH'] || 'amd64'
image = 'kontena/cadvisor'
golang_version = '1.6.4'
goarm = '7'

if arch == 'amd64'
  baseimage = 'alpine'
elsif arch == 'arm64'
  baseimage = 'aarch64/alpine'
else
  exit "arch not supported: #{arch}"
end

task :build do
  if arch == 'amd64'
    sh "docker build --pull -t #{image}:#{version} ."
  else
    sh "docker build --pull -f Dockerfile.arm64 -t #{image}-#{arch}:#{version} ."
  end
end

task :push => :build do
  if arch == 'amd64'
    sh "docker push #{image}:#{version}"
  else
    sh "docker push #{image}-#{arch}:#{version}"
  end
end
