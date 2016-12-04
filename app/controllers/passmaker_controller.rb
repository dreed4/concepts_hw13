class PassmakerController < ApplicationController
require 'securerandom'
  class Person
    def get_ch(ch)
      case ch
        when 'a'
          return "Albert Einstein"
        when 'b'
          return "Beethoven"
        when 'c'
          return "Christopher Columbus"
        when 'd'
          return "Dwight Shrute"
        when 'e'
          return "Eminem"
        when 'f'
          return "Fergie"
        when 'g'
          return "Grandma"
        when 'h'
          return "Hugh Jackman"
        when 'i'
          return "Insidious Kid"
        when 'j'
          return "Joseph Stalin"
        when 'k'
          return "(The) Kardashians"
        when 'l'
          return "Leslie Nope"
        when 'm'
          return "Mickey Mouse"
        when 'n'
          return "Nicki Minaj"
        when 'o'
          return "Oprah"
        when 'p'
          return "(The) Pirate"
        when 'q'
          return "Quentin Tarantino"
        when 'r'
          return "Raymond"
        when 's'
          return "Santa Claus"
        when 't'
          return "Tim McGraw"
        when 'u'
          return "Usher"
        when 'v'
          return "Vin Diesel"
        when 'w'
          return "Whoopie"
        when 'x'
          return "Xena, Warrior Princess"
        when 'y'
          return "Young Jeezy"
        when 'z'
          return "Zooey Deschanel"
        else
          "(no word)"
      end
    end
  end

  class Action
    def get(ch)
      case ch
        when 'a'
          return "assenbled"
        when 'b'
          return "boiled"
        when 'c'
          return "carried"
        when 'd'
          return "divided"
        when 'e'
          return "examines"
        when 'f'
          return "finds"
        when 'g'
          return "grabs"
        when 'h'
          return "hums (to)"
        when 'i'
          return "introduced"
        when 'j'
          return "joked (to)"
        when 'k'
          return "kissed"
        when 'l'
          return "licked"
        when 'm'
          return "milked"
        when 'n'
          return "noticed"
        when 'o'
          return "offended"
        when 'p'
          return "poked"
        when 'q'
          return "questioned"
        when 'r'
          return "repaired"
        when 's'
          return "squaked (at)"
        when 't'
          return "talked (to)"
        when 'u'
          return "unfastened"
        when 'v'
          return "visited"
        when 'w'
          return "whispered (to)"
        when 'x'
          return "x-rayed"
        when 'y'
          return "yelled (at)"
        when 'z'
          return "zoomed (past)"
        else
          return ("(no word)")
      end
    end
  end
  class Animal
    def get(ch)
      case ch
        when 'a'
          return "Alligator"
        when 'b'
          return "Butterfly"
        when 'c'
          return "Crab"
        when 'd'
          return "Dolphin"
        when 'e'
          return "Elephant"
        when 'f'
          return "Frog"
        when 'g'
          return "Giraffe"
        when 'h'
          return "Horse"
        when 'i'
          return "Iguana"
        when 'j'
          return "Jellyfish"
        when 'k'
          return "Kangaroo"
        when 'l'
          return "Lizard"
        when 'm'
          return "Moose"
        when 'n'
          return "Nautilus"
        when 'o'
          return "Owl"
        when 'p'
          return "Panda"
        when 'q'
          return "Quail"
        when 'r'
          return "Rhinoceros"
        when 's'
          return "Snail"
        when 't'
          return "Tiger"
        when 'u'
          return "Unicorn"
        when 'v'
          return "Vulture"
        when 'w'
          return "Walrus"
        when 'x'
          return "Xerus"
        when 'y'
          return "Yak"
        when 'z'
          return "Zebra"
        else
           "(no word)"
      end
    end
  end

  def index
    puts ">> index called"
    p = params
    puts ">> param legnth is : #{p.length}"
    puts ">> params are: #{p[0]} #{p[1].to_s} #{p[2].to_s} "
    if (p.length > 2)
      @output2 = generate(p)
      @mnemonic = get_mnemonic(@output2)
      puts ">> mnemonic: #{@mnemonic}"
    end




  end

  def generate(p)
    if (p[:size].to_i > 0 && p[:size].to_i <= 30)
      size = p[:size].to_i
    elsif (p[:size].to_i > 30)
      size = 30
    else
      size = 9
    end

    puts ">> generate pass called "

    #the following statments make a random string with letters and numbers
    #, ('0'..'9')  numbers will be included eventually
    # ('A'..'Z') Capitalization can be added when have mnemonic for it
    o = [('a'..'z')].map {|i| i.to_a}.flatten
    pass = (0...size).map {o[rand(o.length)]}.join


    return pass
  end

  def get_mnemonic(str)
    pers = Person.new
    act = Action.new
    ani = Animal.new
    m = String.new
    j = 1
    puts ">>>str is #{str}"
    strarr = str.split("")
    puts ">>>strarr is #{strarr.to_s}"
    strarr.each do |i|
      puts ">> i is #{i}"
      puts ">> j is #{j}"
      i = i.downcase
      if (j == 1)
        puts ">> person"
        person = pers.get_ch(i)
        puts ": " + person
        m = m + " " + person
      elsif (j == 2)
        puts ">> action"
        action = act.get(i)
        puts ": " + action
        m = m + " " + action
      elsif (j == 3)
        puts ">> animal"
        animal = ani.get(i)
        puts ": " + animal
        m = m + " the " + animal + ". "
      end

      if (j < 3)
        j = j + 1
      elsif(j == 3)
        j = 1
      end

    end
    puts ">>>>> " + m
    return m

  end

end
