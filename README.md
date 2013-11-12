# AMS Hal Test

This is a testing ground for how I think generating HAL with
ActiveModel::Serializers should work. It's all experimental and may or may not
result in my making a gem or a Pull Request to AMS.

## What it Does

So far, you define a serializer for your model (like my `AuthorSerializer`) and
if you feed `render hal:` an `ActiveRecord::Relation`, it'll run it through the
`HalArraySerializer`, which is sort of a generic serializer that assumes you
just want to embed your records' normal serializers within it. Check out the
`AuthorSerializer` for the `link` helper to see how it builds the `self` link.
The `HalArraySerializer` doesn't yet handle the `self` link. Not shown off yet,
is that AMS's `has_many` and `belongs_to`/`has_one` helpers will generate HAL's
`_embedded` key, too.
