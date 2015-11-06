namespace :check do
  desc "Rake task to get events data"
  task :fetch => :environment do
    projects = Project.all
    projects.each do |check|
      full_website = "http://"+project.website
      website = URI.parse("#{full_website}")
      request = Net::HTTP::Get.new(website.to_s)
      @response = Net::HTTP.start(website.host, website.port) {|http| http.request(request)}
      response_start_time = Time.now
    if @response.code.to_i !=200 && @response.code.to_i !="302"
      user = User.find_by_id(check.user_id)
      EmailSend.mail_send(user.email).deliver
    end
    end
  end
end