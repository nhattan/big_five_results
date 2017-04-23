class BigFiveResultsTextSerializer
  attr_accessor :content

  EMAIL = "nhattan2012@gmail.com"

  FIRST_BIG = ["EXTRAVERSION", "Friendliness", "Gregariousness", "Gregariousness",
     "Assertiveness", "Activity Level", "Excitement-Seeking", "Cheerfulness"]

  SECOND_BIG = ["AGREEABLENESS", "Trust", "Morality", "Altruism", "Cooperation", "Modesty", "Sympathy"]

  THIRD_BIG = ["CONSCIENTIOUSNESS", "Self-Efficacy", "Orderliness", "Dutifulness",
    "Achievement-Striving", "Self-Discipline", "Cautiousness"]

  FOURTH_BIG = ["NEUROTICISM", "Anxiety", "Anger", "Depression", "Self-Consciousness",
    "Immoderation", "Vulnerability"]

  FIFTH_BIG = ["OPENNESS TO EXPERIENCE", "Imagination", "Artistic Interests", "Emotionality",
      "Adventurousness", "Intellect", "Liberalism"]

  def initialize(content)
    @content = content
  end

  def to_hash
    name_regex = /This report compares (.*?) from the country/
    name = content[name_regex, 1]

    [FIRST_BIG, SECOND_BIG, THIRD_BIG, FOURTH_BIG, FIFTH_BIG].flatten.each do |facet|
      regex = /#{facet}\.+(\d+)/
      value = content[regex, 1]
      instance_variable_set("@#{to_underscore(facet)}".to_sym, value)
    end

    result = {
      "NAME" => name,
      "EMAIL" => EMAIL,
      "EXTRAVERSION" => {
        "Overall Score" => @extraversion,
        "Facets" => {
          "Friendliness" => @friendliness,
          "Gregariousness" => @gregariousness,
          "Assertiveness" => @assertiveness,
          "Activity Level" => @activity_level,
          "Excitement-Seeking" => @excitement_seeking,
          "Cheerfulness" => @cheerfulness
        }
      },
      "AGREEABLENESS" => {
        "Overall Score" => @agreeableness,
        "Facets" => {
          "Trust" => @trust,
          "Morality" => @morality,
          "Altruism" => @altruism,
          "Cooperation" => @cooperation,
          "Modesty" => @modesty,
          "Sympathy" => @sympathy
        }
      },
      "CONSCIENTIOUSNESS" => {
        "Overall Score" => @conscientiousness,
        "Facets" => {
          "Self-Efficacy" => @trust,
          "Orderliness" => @morality,
          "Dutifulness" => @altruism,
          "Achievement-Striving" => @cooperation,
          "Self-Discipline" => @modesty,
          "Cautiousness" => @sympathy
        }
      },
      "NEUROTICISM" => {
        "Overall Score" => @neuroticism,
        "Facets" => {
          "Anxiety" => @anxiety,
          "Anger" => @anger,
          "Depression" => @depression,
          "Self-Consciousness" => @self_consciousness,
          "Immoderation" => @immoderation,
          "Vulnerability" => @vulnerability
        }
      },
      "OPENNESS TO EXPERIENCE" => {
        "Overall Score" => @openness_to_experience,
        "Facets" => {
          "Imagination" => @imagination,
          "Artistic Interests" => @artistic_interests,
          "Emotionality" => @emotionality,
          "Adventurousness" => @adventurousness,
          "Intellect" => @intellect,
          "Liberalism" => @liberalism
        }
      }
    }
  end

  def to_underscore(string)
    string.downcase.gsub(/[- ]/, "_")
  end
end
