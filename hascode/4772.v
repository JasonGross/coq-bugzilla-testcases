
Record TruncType := BuildTruncType {
  trunctype_type : Type
}.

Arguments BuildTruncType _ _ {_}. (* This should fail *)
