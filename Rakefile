
version = ENV['VERSION'] || '0.24.1'
arch = ENV['ARCH'] || 'amd64'
image = 'kontena/cadvisor'

task :build do
  if arch == 'amd64'
    sh "docker build --pull -t #{image}:#{version} ."
  else
    sh "docker build --pull -f Dockerfile.#{arch} -t #{image}-#{arch}:#{version} ."
  end
end

task :push => :build do
  if arch == 'amd64'
    sh "docker push #{image}:#{version}"
  else
    sh "docker push #{image}-#{arch}:#{version}"
  end
end
