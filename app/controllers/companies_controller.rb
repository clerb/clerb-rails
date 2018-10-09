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
      }
    ].shuffle
  end
end
