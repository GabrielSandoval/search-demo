class ArticlesIndex < Chewy::Index
  settings analysis: {
    filter: {
      filter_stemmer: {
        type: :stemmer,
        language: "english"
      }
    },
    analyzer: {
      std_fold: {
        tokenizer: "standard",
        filter: %w[lowercase asciifolding stop filter_stemmer]
      }
    }
  }

  index_scope Article

  field :title
end
