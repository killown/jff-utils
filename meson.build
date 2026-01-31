project(
        'jff-utils',
        'cpp',
        version: '0.4.0',
        license: 'MIT',
        meson_version: '>=0.50.0',
        default_options: [
        'cpp_std=c++17',
                'warning_level=2',
                'werror=false',
        ],
)

add_project_arguments(['-Wno-deprecated-declarations'], language: ['cpp'])

sources = [
'jff/action/action.cpp',
'jff/condition/condition.cpp',
'jff/condition/logic_condition.cpp',
'jff/condition/test_condition.cpp',
'jff/lexer/lexer.cpp',
'jff/lexer/literal.cpp',
'jff/lexer/symbol.cpp',
'jff/parser/action_parser.cpp',
'jff/parser/condition_parser.cpp',
'jff/parser/lambda_rule_parser.cpp',
'jff/parser/rule_parser.cpp',
'jff/rule/lambda_rule.cpp',
'jff/rule/rule.cpp',
'jff/variant.cpp',
]

wfutils_inc = include_directories('.')

lib_wfutils = library('jff-utils',
    sources,
    dependencies: [],
    include_directories: wfutils_inc,
    install: true,
    version: meson.project_version())

pkgconfig = import('pkgconfig')
pkgconfig.generate(
    libraries:    lib_wfutils,
    version:      meson.project_version(),
    filebase:     meson.project_name(),
    name:         meson.project_name(),
    description: 'Utilities library for Wayfire')

install_headers([], subdir: 'jff/utils')

wfutils = declare_dependency(link_with: lib_wfutils,
    include_directories: wfutils_inc)

# -------------------------------------------------------------------------------------------------
# Install headers
headers_action = [
'jff/action/action.hpp',
'jff/action/action_interface.hpp',
]

headers_condition = [
'jff/condition/access_interface.hpp',
'jff/condition/condition.hpp',
'jff/condition/logic_condition.hpp',
'jff/condition/test_condition.hpp',
]

headers_lexer = [
'jff/lexer/lexer.hpp',
'jff/lexer/literal.hpp',
'jff/lexer/symbol.hpp',
]

headers_parser = [
'jff/parser/action_parser.hpp',
'jff/parser/condition_parser.hpp',
'jff/parser/rule_parser.hpp',
'jff/parser/lambda_rule_parser.hpp',
]

headers_rule = [
'jff/rule/lambda_rule.hpp',
'jff/rule/rule.hpp',
]

headers_root = [
'jff/utils.hpp',
'jff/variant.hpp',
]

install_headers(headers_action, subdir: 'jff/action')
install_headers(headers_condition, subdir: 'jff/condition')
install_headers(headers_lexer, subdir: 'jff/lexer')
install_headers(headers_parser, subdir: 'jff/parser')
install_headers(headers_rule, subdir: 'jff/rule')
install_headers(headers_root, subdir: 'jff')

# -------------------------------------------------------------------------------------------------
# Unit tests
#subdir('test')

# -------------------------------------------------------------------------------------------------
# Documentation
# TODO: Figure out how to install the doc package with meson.

doxygen = find_program('doxygen', required: false)

if doxygen.found()
  cdata = configuration_data()
  cdata.set('TOP_SRCDIR', meson.source_root())
  cdata.set('TOP_BUILDDIR', meson.build_root())
  cdata.set('OUTPUT_DIR', join_paths(meson.build_root(),'docs'))
  cdata.set('README_PATH', join_paths(meson.source_root(),'README.md'))
  cdata.set('VERSION', meson.project_version())
  cdata.set('PROJECT_NAME', meson.project_name())

  doxyfile = configure_file(input: 'Doxyfile.in',
                            output: 'Doxyfile',
                            configuration: cdata,
                            install: false)

  doc_target = run_target('doc',command: [doxygen, doxyfile])
endif
