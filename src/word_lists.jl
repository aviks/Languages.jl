for f in (:articles, :indefinite_articles, :definite_articles,
          :prepositions, :pronouns, :stopwords)
  @eval begin
    function ($f){T <: Language}(l::Type{T})
      filename = Pkg.dir("Languages", "data", string($(f)), string(string(l), ".txt"))
      return fetch_word_list(filename)
    end
  end
end
