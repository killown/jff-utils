TEMPLATE = app
CONFIG += console c++17
CONFIG -= app_bundle
CONFIG -= qt

SOURCES += \
    jff/lexer/lexer.cpp \
    jff/lexer/literal.cpp \
    jff/lexer/symbol.cpp \
    jff/parser/lambda_rule_parser.cpp \
    jff/parser/rule_parser.cpp \
    jff/parser/action_parser.cpp \
    jff/parser/condition_parser.cpp \
    jff/action/action.cpp \
    jff/rule/lambda_rule.cpp \
    jff/rule/rule.cpp \
    jff/condition/condition.cpp \
    jff/condition/logic_condition.cpp \
    jff/condition/test_condition.cpp \
    jff/variant.cpp \
    main.cpp \

HEADERS += \
    jff/action/action.hpp \
    jff/action/action_interface.hpp \
    jff/lexer/lexer.hpp \
    jff/lexer/literal.hpp \
    jff/lexer/symbol.hpp \
    jff/parser/lambda_rule_parser.hpp \
    jff/parser/rule_parser.hpp \
    jff/parser/condition_parser.hpp \
    jff/parser/action_parser.hpp \
    jff/rule/lambda_rule.hpp \
    jff/utils.hpp \
    jff/condition/access_interface.hpp \
    jff/condition/condition.hpp \
    jff/rule/rule.hpp \
    jff/condition/logic_condition.hpp \
    jff/condition/test_condition.hpp \
    jff/variant.hpp

DISTFILES += \
    meson.build \
    Makefile \
    README.md \
    Doxyfile.in
