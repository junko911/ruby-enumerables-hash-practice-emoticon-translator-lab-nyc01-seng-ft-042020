# require modules here
require "yaml"
require "pp"

def load_library(path)
  # code goes here
  emoticons = YAML.load_file(path)
  list = {}
  
  meaning_list = {}
  emoticons.each do |key, value|
    meaning_list[value[1]] = key 
  end
  
  emoticon_list = {}
  emoticons.each do |key, value|
    emoticon_list[value[0]] = value[1]
  end
  
  
  list["get_meaning"] = meaning_list
  list["get_emoticon"] = emoticon_list
  
  list
end

def get_japanese_emoticon(path, emoticon)
  # code goes here
  if load_library(path)[:get_emoticon].include? (emoticon)
    load_library(path)[:get_emoticon][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
  
end

def get_english_meaning(path, emoticon)
  # code goes here
  data = load_library(path)
  if data["get_meaning"].has_key?(emoticon)
    data["get_meaning"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
  
end

get_english_meaning("./lib/emoticons.yml", "(Ｔ▽Ｔ)")

