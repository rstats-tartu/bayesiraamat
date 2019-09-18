#!/bin/sh

git clone -b gh-pages git@github.com:rstats-tartu/bayesiraamat.git book-output \
  && cd book-output \
  && cp -r ../_book/* ./ \
  && git add --all * \
  && git commit -m "Update the book" \
  && git push -q origin gh-pages
