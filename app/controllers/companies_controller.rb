class CompaniesController < ApplicationController
  def index
    @companies = [
      {
        name: "RVshare",
        image: "images/rvshare.jpg"
      },
      {
        name: "Coffee and Code",
        image: "images/coffee_and_code.png"
      },
      {
        name: "CoverMyMeds",
        image: "images/covermymeds.png"
      },
      {
        name: "LevelSeven",
        image: "images/level_seven.jpeg"
      },
      {
        name: "Within3",
        image: "images/within3.png"
      },
      {
        name: "University Tees",
        image: "images/u_tees.jpg"
      },
      {
        name: "LeanDog",
        image: "images/leandog.svg"
      },
      {
        name: "VHT",
        image: "images/vht.png"
      }
    ].shuffle
  end
end
