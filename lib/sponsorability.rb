class Sponsorability

    def self.runcheck(placings, partcipants, tournaments, streamHours, minutesOfVideo)
        tournamentScore = 0
        sponsorabilityScore = 0
        rank = ""
        rankUp = 0

        recommendTournamentSize = 0
        recommendPlacings = 0
        recommendVideo = 0
        recommendStream = 0

        tournamentScore = participants - placings

        sponsorabilityScore = tournamentScore * (streamHours + (minutesOfVideo/2))

        if sponsorabilityScore < 4000 
            rank = "D"
            rankUp = 4000 - sponsorabilityScore
            
            recommendTournamentSize = 100
            recommendPlacings = 0.5
            recommendVideo = 80
            recommendStream = 40

        elsif sponsorabilityScore > 4000 && sponsorabilityScore < 35000 
            rank = "C"
            rankUp = 350000 - sponsorabilityScore

            recommendTournamentSize = 250
            recommendPlacings = 0.25
            recommendVideo = 160
            recommendStream = 80

        elsif sponsorabilityScore > 35000 && sponsorabilityScore < 100000  
            rank = "B"
            rankUp = 100000 - sponsorabilityScore

            recommendTournamentSize = 500
            recommendPlacings = 0.1
            recommendVideo = 240
            recommendStream = 120

        elsif sponsorabilityScore > 100000 && sponsorabilityScore < 300000  
            rank = "A"
            rankUp = 300000 - sponsorabilityScore

            recommendTournamentSize = 1000
            recommendPlacings = 0.05
            recommendVideo = 320
            recommendStream = 160

        else  
            rank = "S"
            rankUp = 0

            recommendTournamentSize = 1000
            recommendPlacings = 0.05
            recommendVideo = 320
            recommendStream = 160
        end


        response = "<h3>Your score is: " + sponsorabilityScore + " | Rank: " + rank + "</h3>"

        if rankUp != 0
            response << "<p>Only " + rankUp + " points to go until the next Rank!</p>"
        end


        if (participants / tournaments) < recommendTournamentSize
            response << "<li>Try entering larger tournaments more frequently!</li>"
        end

        if (placings / participants) > recommendPlacings
            response << "<li>Try placing higher in tournaments more consistently!</li>"
        end

        if minutesOfVideo < recommendVideo
            response << "<li>Try uploading " + recommendVideo + " minutes of video to YouTube per week!</li>"
        end

        if streamHours < recommendStream
            response << "<li>Try streaming " + recommendStream + " hours per week!</li>"
        end

        return response
    end
end
        