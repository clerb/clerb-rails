class CompaniesController < ApplicationController
  def index
    @companies = [
      {
        name: "RVshare",
        image: "images/rvshare.jpg",
        url: "https://rvshare.com"
      },
      {
        name: "Coffee and Code",
        image: "images/coffee_and_code.png",
        url: "https://www.coffeeandcode.com"
      },
      {
        name: "CoverMyMeds",
        image: "images/covermymeds.png",
        url: "https://www.covermymeds.com"
      },
      {
        name: "LevelSeven",
        image: "images/level_seven.jpeg",
        url: "https://www.lvlsvn.com"
      },
      {
        name: "Within3",
        image: "images/within3.png",
        url: "https://www.within3.com"
      },
      {
        name: "University Tees",
        image: "images/u_tees.jpg",
        url: "https://universitytees.com"
      },
      {
        name: "LeanDog",
        image: "images/leandog.png",
        url: "https://www.leandog.com"
      },
      {
        name: "VHT",
        image: "images/vht.png",
        url: "https://www.vhtcx.com"
      },
      {
        name: "Assurant Labs",
        image: "images/assurant.png",
        url: "https://www.assurantlabs.com"
      }
    ].shuffle
  end

  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if @company.valid?
      if create_github_issue(@company)
        flash[:notice] = "Thank you! You may view your request on GitHub <a href='https://github.com/#{ENV['GITHUB_REPO']}/labels/new_company_request'>here</a>."

        redirect_to action: "index"
        return
      else
        flash[:alert] = "I'm sorry, we're unable to save your request currently but you may try logging it manually on GitHub <a href='https://github.com/#{ENV['GITHUB_REPO']}/issues'>here</a>."
      end
    else
      flash[:alert] = "Please complete all required fields on this form"
    end
    render :new
  end

  def company_params
    params.require(:company).permit(:company_name, :website, :image_url, :additional_comments)
  end

  private

  def create_github_issue(_company)
    conn = Faraday.new(url: "https://api.github.com/repos/#{ENV['GITHUB_REPO']}/issues?access_token=#{ENV['GITHUB_ACCESS_TOKEN']}")
    response = conn.post do |req|
      req.headers["Content-Type"] = "application/json"
      req.body = {
        access_token: ENV["GITHUB_ACCESS_TOKEN"],
        title: "New Company Request - #{company_params[:company_name]}",
        body: """
          Company Name: #{@company.company_name};
          Copmany Website: #{@company.website};
          Link to image: #{@company.image_url};
          Additional Comments: #{@company.additional_comments};
          """,
        labels: [
          "new_company_request"
        ]
      }.to_json
    end
    response.success?
  end
end
