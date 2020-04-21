require 'spec_helper'

FactoryBot.define do
  factory :user do
    token { 'EAAVUjZAZBCczsBACUe0udAyVeCdq9xMmx4x0mpErRlVs3p13eL5FzFV76ZCHrqnO3bxVr8sBcl1ZCvYKmClTUuwAtVAcbUOYhRmAgzgoNe13Qm1CT3nXhOnxUwjqfjBIWSJAY02mhdH6fBj5iYiZBEBtZBCl9uAekdhZCKZC9BZBvavZC9R66aWYvMzVJQGksDwqP6cA7Q804WjwZDZD' }
    name { 'Tyler Alejeeiaeejcd Fallerescu' }
    uid { '102445408117431' }
    image_url { 'https://picsum.photos/id/237/200/300' }
    provider {'facebook'}
  end
end