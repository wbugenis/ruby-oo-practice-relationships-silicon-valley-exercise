class VentureCapitalist
    attr_accessor :name, :total_worth

    @@all = []

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
        self.class.all << self
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        VentureCapitalist.all.select{|capitalist| capitalist.total_worth >= 1_000_000_000}
    end

    def offer_contract(startup, type, investment)
        FundingRound.new(startup, self, type, investment)
    end

    def funding_rounds
        FundingRound.all.select{ |round| round.venture_capitalist == self}
    end

    def portfolio
        funding_rounds.map{ |round| round.startup}.uniq
    end

    def biggest_investment
        funding_rounds.max_by{ |round| round.investment}
    end

    def invested(domain)
        funding_rounds.select{ |round| round.startup.domain == domain}.sum{|round| round.investment}
    end

end
