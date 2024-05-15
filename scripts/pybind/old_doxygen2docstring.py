# -*- coding: utf-8 -*-
""" doxygen2docstring.py

  This script converts XML file generated by Doxygen (C++)
  into docstring format (Python). The output is a C++ file
  containing char* strings of docstring values, available as
  constants. They can be used with pybind11 for sharing C++
  documentation to Python binding.
  
  Project: codac
  Author: Simon Rohou
  Date: 2020
"""

import os
import sys
import xml.etree.ElementTree as ET

def anchor_id(filename, memberdef, txt=""):
  '''
  Extract the anchor id from full string name obtained from Doxygen  <anchor> tag
  '''

  anchor = filename.replace(".h", "") \
                   .replace(".cpp", "") \
                   .replace("codac_", "") \
                   .replace("codac2_", "") \
                   .replace("_", "")
  anchor += "FILE"

  if txt!="":

    anchor += "_" + txt

  if memberdef:

    anchor += "_" + "".join(memberdef.find(".//type").itertext()).replace("_", "")

    anchor += "_" + memberdef.find("./name").text

    # List of arguments (if any)
    for param in memberdef.findall("./param"):
      anchor += ("_"+"".join(param.find("type").itertext())) #.replace("_", "")

  else:

    anchor += "_MAIN" # main documentation (e.g. of the entire class)

  return anchor.replace("<", "") \
               .replace(">", "") \
               .replace(",", "") \
               .replace(" ", "") \
               .replace(".", "") \
               .replace("std::", "") \
               .replace("ibex::", "IBEX") \
               .replace("codac::", "") \
               .replace("codac2::", "") \
               .replace("::", "") \
               .replace("@", "_") \
               .replace("|=", "UNIEQ") \
               .replace("&=", "INTEQ") \
               .replace("/=", "DIVEQ") \
               .replace("*=", "MULEQ") \
               .replace("+=", "ADDEQ") \
               .replace("-=", "MINEQ") \
               .replace("==", "EQ") \
               .replace("!=", "NEQ") \
               .replace("=", "AFF") \
               .replace("operator|", "OPERATORUNI") \
               .replace("operator&", "OPERATORINT") \
               .replace("operator+", "OPERATORADD") \
               .replace("operator-", "OPERATORMIN") \
               .replace("operator*", "OPERATORMUL") \
               .replace("operator/", "OPERATORDIV") \
               .replace("operator!", "OPERATORNOT") \
               .replace("()", "P") \
               .replace("(", "") \
               .replace(")", "") \
               .replace("&", "") \
               .replace("[]", "B") \
               .replace("friend", "") \
               .replace("~", "destruct_") \
               .replace("__", "_") \
               .replace("*", "") \
               .replace("\"", "") \
               .upper() \
               .replace("NAMESPACECODAC2XML", "")

def normalize(str):
  '''
  Performs normalization on str: removes C++ conventions, converts
  some math symbols, trim the string, etc.
  '''
  return str.replace("const", "") \
            .replace("std::", "") \
            .replace("ibex::", "") \
            .replace("codac::", "") \
            .replace("codac2::", "") \
            .replace("< ", "<") \
            .replace(" >", ">") \
            .replace("*", "") \
            .replace("\\cdot", "·") \
            .replace("\\infty", "∞") \
            .replace("\\forall", "∀") \
            .replace("\\in[", "ϵ[") \
            .replace("\\in ", "ϵ ") \
            .replace("\\int", "∫") \
            .replace("\\tau", "τ") \
            .replace("\\exists ", "∃ ") \
            .replace("\\mid ", " | ") \
            .replace("\\delta", "δ") \
            .replace("\\subseteq", "⊆") \
            .replace("\\subset", "⊂") \
            .replace("\\llbracket ", "⟦") \
            .replace("\\llbracket", "⟦") \
            .replace("\\rrbracket", "⟧") \
            .replace("\\mathcal{C}", "C") \
            .replace("::", ".") \
            .replace("  ", " ") \
            .replace("$", "") \
            .replace("\n", "") \
            .replace("\\dots", "...") \
            .replace("&", "").strip()

def get_tags_text(tag):
  '''
  Return the content of a tag, including the content of its sub-items.
  '''
  return normalize("".join(tag.itertext()))

def sentence(str):
  '''
  Adds a point at the end of str, if not already present.
  '''
  return (str + ".").replace("..",".")

if not os.path.exists(sys.argv[1]):
  print("-- /!\\ Enable to build doc files (generate XML Doxygen files first)")
  quit()

#os.rmdir(sys.argv[2]) # removing previously generated docstrings

files = os.listdir(sys.argv[1])
for xml_doc in files:

  #if ("class" not in xml_doc) and ("namespacecodac" not in xml_doc):
  #  continue

  namespace_only = ("namespacecodac" in xml_doc)

  namespace = "codac2"
  indent = "  "

  # Parsing XML file from Doxygen output (XML mode enabled)
  tree = ET.parse(sys.argv[1] + "/" + xml_doc)
  root = tree.getroot()

#  if namespace_only:
#    input_filename = xml_doc
#    output_file_fullpath = sys.argv[2] + "/codac2_py_namespace_docs.h"
#
#  else:
  if root.find(".//location") == None:
    continue

  input_filename = root.find(".//location").get("file").split("/")[-1]
  output_filename = input_filename.replace(".h", "_docs.h").replace("codac2_", "codac2_py_")
  output_file_fullpath = sys.argv[2] + "/" + output_filename

  # We do not want to create again the files if nothing has changed since last
  # generation (it would cause unnecessary compilation of python-binding files,
  # quite long). So we compare the modification dates.

  # Actual last update of the XML file
  last_update_time = os.path.getmtime(sys.argv[1] + "/" + xml_doc)
  last_update_time_str = "// Last update of XML file: " + str(last_update_time)

  # Last update of previous generation (if any)
  first_line = ""
  if os.path.isfile(output_file_fullpath):
    with open(output_file_fullpath) as f_prev:
      first_line = f_prev.readline()

  if first_line.strip() == last_update_time_str.strip(): # no update
    continue

  if os.path.isdir(output_file_fullpath):
    continue
  
  with open(output_file_fullpath, 'a', encoding='utf-8') as f:
    
    if os.stat(output_file_fullpath).st_size == 0:
      print(last_update_time_str, file=f) # to check last update for next generations of files
      print("// This file has been generated by CMake and doxygen2docstring.py", file=f)
      print("// From XML file: " + xml_doc + "\n", file=f)

    # Main documentation (ex: comment of the class)
    str_class_label = root.find("./compounddef/compoundname").text
    print("/// " + str_class_label, file=f)
    print("const char* " + anchor_id(input_filename, None, str_class_label) +  " = R\"_docs(", end="", file=f)

    para = root.find(".//compounddef/briefdescription/para")
    if para:
      print(sentence(get_tags_text(para)), end="", file=f)
    
    print(")_docs\";\n", file=f)

    # Refers to all memberdef containing an <anchor> tag
    for memberdef in root.findall(".//memberdef"):

      if memberdef.find("./definition") == None:
        continue

      # Doc string
      print("// " + memberdef.find("./definition").text, end="", file=f)
      argstring = memberdef.find("./argsstring").text
      if argstring:
        print(argstring, end="", file=f)
      print("", file=f)

      print("const char* " + anchor_id(input_filename, memberdef, str_class_label) +  " = R\"_docs(", end="", file=f)

      # Brief description
      briefdescription = sentence(get_tags_text(memberdef.find("briefdescription")))
      print(briefdescription, file=f)

      # Optional notes
      list_notes = memberdef.findall(".//simplesect[@kind='note']")
      if len(list_notes):
        print("", file=f)
      for note in list_notes:
        print(sentence(get_tags_text(note)), file=f)

      # List of arguments (if any)
      params = memberdef.findall("./param")

      if len(params):
        print("\nArgs:", file=f)

        for param in params:
          param_name = param.find("declname")
          if param_name != None and param_name.text:
            print(indent + param_name.text, "(" + get_tags_text(param.find("type")) + "): ", end='', file=f)
            parameterlist = memberdef.find("detaileddescription/para/parameterlist")

            if parameterlist:
              for parameteritem in parameterlist.iter("parameteritem"):
                if parameteritem.find("parameternamelist").find("parametername").text == param_name.text:
                  param_description = sentence(get_tags_text(parameteritem.find("parameterdescription")))
                  print(param_description, file=f)

      # Return value (if any)
      return_val = memberdef.find(".//simplesect[@kind='return']")
      if return_val:
        print("\nReturns:", file=f)
        print(indent + sentence(get_tags_text(return_val.find("para"))), file=f)

      # Ending
      print(")_docs\";\n", file=f)

    print("\n\n", file=f)