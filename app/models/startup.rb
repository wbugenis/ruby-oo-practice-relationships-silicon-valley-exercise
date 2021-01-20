class Startup
    attr_accessor :name, :domain
    attr_reader :founder

    @@all = []

    def initialize(name, domain, founder)
        @name = name
        @domain = domain
        @founder = founder
        self.class.all << self
    end

    def self.all
        @@all
    end

    def pivot(domain, name)
        self.domain = domain
        self.name = name
    end

    def Startup.find_by_founder(founder_name)
        Startup.all.find{ |startup| startup.founder == founder_name}
    end

    def Startup.domains
        Startup.all.map{ |startup| startup.domain}
    end

    def sign_contract(venture_capitalist, type, amount)
        FundingRound.new(self, venture_capitalist, type, amount)
    end

    #Finds FundingRounds belonging to a Startup object
    def funding_round_finder
        FundingRound.all.select{ |round| round.startup == self}
    end
        
    def num_funding_rounds
        funding_round_finder.count
    end

    def total_funds
        funding_round_finder.sum{ |round| round.investment}
    end

    def investors
        funding_round_finder.map{ |round| round.venture_capitalist}.uniq
    end

    def big_investors
        VentureCapitalist.tres_commas_club.select{ |capitalist| investors.include?(capitalist)}.uniq
    end
end
