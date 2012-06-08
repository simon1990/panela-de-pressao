Feature: View a campaign's detail
  In order to know better a campaign
  as a citizen
  I want to see a campaigns' detail

  Scenario: One accepted campaign exists 
    Given there is a campaign called "Desarmamento Voluntário" accepted on "1/1/2012"
    When I go to the campaigns page
    And I click "Desarmamento Voluntário"
    Then I should see the campaigns' name
    Then I should see the campaigns' description 
    Then I should see the campaigns' image

  Scenario: One accepted campaign exists and there's 1 organization as partner
    Given there is a campaign called "Desarmamento Voluntário" with an organization "MeuRio" as supporter accepted on "1/1/2012"
    When I go to the campaigns page
    And I click "Desarmamento Voluntário"
    Then I should see an avatar from organization "MeuRio"

  Scenario: One accepted campaign exists and there's 1 organization as partner and 5 people poked an influencer
    Given there is a campaign called "Desarmamento Voluntário" with an organization "MeuRio" as supporter accepted on "1/1/2012"
    And there is 5 pokers for this campaign
    When I go to this campaign page
    Then I should see "Quem está pressionando os alvos"
    Then I should see a list of 5 recent pokers

  Scenario: when the campaign doesn't have organization
    Given there is a campaign created by "Luiz Fonseca" with no partnership
    When I go to this campaign page
    Then I should see "Quem faz acontecer"
    And I should see "Luiz Fonseca"

  Scenario: when the campaign have an organization
    Given there is a campaign created by "Luiz Fonseca" with a partnership with "Associação dos moradores de São Conrado"
    When I go to this campaign page
    Then I should see "Quem faz acontecer"
    And I should see "Associação dos moradores de São Conrado"
    And I should not see "Luiz Fonseca"
