require 'colorize'

require_relative './scraper.rb'

class Monarch
    attr_accessor :name, :url, :dynasty, :title, :reign, :bio # All except @title and @bio come from second scrape

    @@all = []

    def initialize(name, dynasty, reign)
        @name = name
        @url = url
        @dynasty = dynasty
        @reign = reign
        @@all << self
    end

    def self.all
        @@all
    end

    def name_and_reign
        "#{name[-1].to_i != 0 ? name.chop : name} (reigned #{reign} AD)"
    end

    def self.print_monarchs_for_selection
        @@all.each_with_index { |monarch, i| puts "#{i+1}. #{monarch.name_and_reign}" } # | #{monarch.dynasty.name} optional
    end

    def print_monarch_bio
        Scraper.scrape_2(self)
        puts "[-+-]"
        puts name_and_reign.green
        puts "#{@title.upcase}. Dynasty: #{dynasty.name.upcase}"
        puts ""
        puts @bio
        puts "\n(Read more at #{url.join(" ")})"
    end

end