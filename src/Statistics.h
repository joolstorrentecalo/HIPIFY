/*
Copyright (c) 2015 - present Advanced Micro Devices, Inc. All rights reserved.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
*/

#pragma once

#include <chrono>
#include <string>
#include <fstream>
#include <map>
#include <set>
#include <llvm/ADT/StringRef.h>
#include <llvm/Support/raw_ostream.h>

namespace chr = std::chrono;

enum ConvTypes {
  // Driver API:  5.2. Error Handling
  // Runtime API: 5.3. Error Handling
  CONV_ERROR = 0,
  // Driver API : 5.3. Initialization
  CONV_INIT,
  // Driver API : 5.4. Version Management
  // Runtime API: 5.28. Version Management
  CONV_VERSION,
  // Driver API : 5.5. Device Management, 5.6. Device Management [DEPRECATED]
  // Runtime API: 5.1. Device Management
  CONV_DEVICE,
  // Driver API : 5.7. Primary Context Management, 5.8.Context Management, 5.9. Context Management [DEPRECATED]
  CONV_CONTEXT,
  // Driver API : 5.10. Module Management
  CONV_MODULE,
  // Driver API : 5.11. Memory Management
  // Runtime API: 5.9. Memory Management, 5.10. Memory Management [DEPRECATED]
  CONV_MEMORY,
  // Driver API : 5.12. Virtual Memory Management
  CONV_VIRTUAL_MEMORY,
  // Driver API : 5.13. Unified Addressing
  // Runtime API: 5.11. Unified Addressing
  CONV_ADDRESSING,
  // Driver API : 5.14. Stream Management
  // Runtime API: 5.4. Stream Management
  CONV_STREAM,
  // Driver API : 5.15. Event Management
  // Runtime API: 5.5. Event Management
  CONV_EVENT,
  // Driver API : 5.16. External Resource Interoperability
  // Runtime API: 5.6.External Resource Interoperability
  CONV_EXT_RES,
  // Driver API : 5.17. Stream memory operations
  CONV_STREAM_MEMORY,
  // Driver API : 5.18. Execution Control, 5.19. Execution Control [DEPRECATED]
  // Runtime API: 5.7.Execution Control, Former 5.9. Execution Control [DEPRECATED]
  CONV_EXECUTION,
  // Driver API : 5.20. Graph Management
  // Runtime API: 5.29. Graph Management
  CONV_GRAPH,
  // Driver API : 5.21. Occupancy
  // Runtime API: 5.8. Occupancy
  CONV_OCCUPANCY,
  // Driver API : 5.22. Texture Reference Management [DEPRECATED], 5.24. Texture Object Management
  // Runtime API: 5.24. Texture Reference Management [DEPRECATED], 5.26. Texture Object Management
  CONV_TEXTURE,
  // Driver API : 5.23. Surface Reference Management [DEPRECATED], 5.25. Surface Object Management
  // Runtime API: 5.25. Surface Reference Management [DEPRECATED], 5.27. Surface Object Management
  CONV_SURFACE,
  // Driver API : 5.26. Peer Context Memory Access
  // Runtime API: 5.12. Peer Device Memory Access
  CONV_PEER,
  // Driver API : 5.27. Graphics Interoperability
  // Runtime API: 5.23. Graphics Interoperability
  CONV_GRAPHICS,
  // Runtime API: 5.31. Interactions with the CUDA Driver API
  CONV_INTERACTION,
  // Driver API : 5.28. Profiler Control
  // Runtime API: 5.32. Profiler Control
  CONV_PROFILER,
  // Driver API : 5.29. OpenGL Interoperability
  // Runtime API: 5.13. OpenGL Interoperability, 5.14. OpenGL Interoperability [DEPRECATED]
  CONV_OPENGL,
  // Driver API : 5.30. Direct3D 9 Interoperability
  // Runtime API: 5.15. Direct3D 9 Interoperability, 5.16. Direct3D 9 Interoperability [DEPRECATED]
  CONV_D3D9,
  // Driver API : 5.31. Direct3D 10 Interoperability
  // Runtime API: 5.17. Direct3D 10 Interoperability, 5.18. Direct3D 10 Interoperability [DEPRECATED]
  CONV_D3D10,
  // Driver API : 5.32. Direct3D 11 Interoperability
  // Runtime API: 5.19. Direct3D 11 Interoperability, 5.20. Direct3D 11 Interoperability [DEPRECATED]
  CONV_D3D11,
  // Driver API : 5.33. VDPAU Interoperability
  // Runtime API: 5.21. VDPAU Interoperability
  CONV_VDPAU,
  // Driver API : 5.34. EGL Interoperability
  // Runtime API: 5.22. EGL Interoperability
  CONV_EGL,
  // Runtime API: 5.2. Thread Management [DEPRECATED]
  CONV_THREAD,
  CONV_COMPLEX,
  CONV_LIB_FUNC,
  CONV_LIB_DEVICE_FUNC,
  CONV_DEVICE_FUNC,
  CONV_INCLUDE,
  CONV_INCLUDE_CUDA_MAIN_H,
  CONV_TYPE,
  CONV_LITERAL,
  CONV_NUMERIC_LITERAL,
  CONV_DEFINE,
  CONV_EXTERN_SHARED,
  CONV_KERNEL_LAUNCH,
  CONV_LAST
};
constexpr int NUM_CONV_TYPES = (int) ConvTypes::CONV_LAST;

enum ApiTypes {
  API_DRIVER = 0,
  API_RUNTIME,
  API_COMPLEX,
  API_BLAS,
  API_RAND,
  API_DNN,
  API_FFT,
  API_SPARSE,
  API_CUB,
  API_CAFFE2,
  API_LAST
};
constexpr int NUM_API_TYPES = (int) ApiTypes::API_LAST;

enum SupportDegree {
  FULL = 0x0,
  HIP_UNSUPPORTED = 0x1,
  ROC_UNSUPPORTED = 0x2,
  UNSUPPORTED = 0x4,
  DEPRECATED = 0x8,
  HIP_DEPRECATED = 0x10,
  REMOVED = 0x20,
  HIP_REMOVED = 0x40,
};
constexpr int CUDA_DEPRECATED = (int) SupportDegree::DEPRECATED;
constexpr int CUDA_REMOVED = (int) SupportDegree::REMOVED;

enum cudaVersions {
  CUDA_0 = 0, // Unknown version
  CUDA_70 = 7000,
  CUDA_75 = 7050,
  CUDA_80 = 8000,
  CUDA_90 = 9000,
  CUDA_91 = 9010,
  CUDA_92 = 9020,
  CUDA_100 = 10000,
  CUDA_101 = 10010,
  CUDA_102 = 10020,
  CUDA_110 = 11000,
};

struct cudaAPIversions {
  cudaVersions appeared = cudaVersions::CUDA_70;
  cudaVersions deprecated = cudaVersions::CUDA_0;
  cudaVersions removed = cudaVersions::CUDA_0;
};

// The names of various fields in in the statistics reports.
extern const char *counterNames[NUM_CONV_TYPES];
extern const char *counterTypes[NUM_CONV_TYPES];
extern const char *apiNames[NUM_API_TYPES];
extern const char *apiTypes[NUM_API_TYPES];

struct hipCounter {
  llvm::StringRef hipName;
  llvm::StringRef rocName;
  ConvTypes type;
  ApiTypes apiType;
  unsigned int apiSection;
  unsigned int supportDegree;
};

/**
  * Tracks a set of named counters, as well as counters for each of the type enums defined above.
  */
class StatCounter {
private:
  // Each thing we track is either "supported" or "unsupported"...
  std::map<std::string, int> counters;
  int apiCounters[NUM_API_TYPES] = {};
  int convTypeCounters[NUM_CONV_TYPES] = {};

public:
  void incrementCounter(const hipCounter &counter, const std::string &name);
  // Add the counters from `other` onto the counters of this object.
  void add(const StatCounter &other);
  int getConvSum();
  void print(std::ostream* csv, llvm::raw_ostream* printOut, const std::string &prefix);
};

/**
  * Tracks the statistics for a single input file.
  */
class Statistics {
  StatCounter supported;
  StatCounter unsupported;
  std::string fileName;
  std::set<int> touchedLinesSet = {};
  unsigned touchedLines = 0;
  unsigned totalLines = 0;
  unsigned touchedBytes = 0;
  int totalBytes = 0;
  chr::steady_clock::time_point startTime;
  chr::steady_clock::time_point completionTime;

public:
  Statistics(const std::string &name);
  void incrementCounter(const hipCounter &counter, const std::string &name);
  // Add the counters from `other` onto the counters of this object.
  void add(const Statistics &other);
  void lineTouched(int lineNumber);
  void bytesChanged(int bytes);
  // Set the completion timestamp to now.
  void markCompletion();

public:
  /**
    * Pretty-print the statistics stored in this object.
    *
    * @param csv Pointer to an output stream for the CSV to write. If null, no CSV is written
    * @param printOut Pointer to an output stream to print human-readable textual stats to. If null, no
    *                 such stats are produced.
    */
  void print(std::ostream* csv, llvm::raw_ostream* printOut, bool skipHeader = false);
  // Print aggregated statistics for all registered counters.
  static void printAggregate(std::ostream *csv, llvm::raw_ostream* printOut);
  // The Statistics for each input file.
  static std::map<std::string, Statistics> stats;
  // The Statistics objects for the currently-being-processed input file.
  static Statistics* currentStatistics;
  // Aggregate statistics over all entries in `stats` and return the resulting Statistics object.
  static Statistics getAggregate();
  /**
    * Convenient global entry point for updating the "active" Statistics. Since we operate single-threadedly
    * processing one file at a time, this allows us to simply expose the stats for the current file globally,
    * simplifying things.
    */
  static Statistics &current();
  /**
    * Set the active Statistics object to the named one, creating it if necessary, and write the completion
    * timestamp into the currently active one.
    */
  static void setActive(const std::string &name);
  // Check the counter and option TranslateToRoc whether it should be translated to Roc or not.
  static bool isToRoc(const hipCounter &counter);
  // Check whether the counter is HIP_UNSUPPORTED or not.
  static bool isHipUnsupported(const hipCounter &counter);
  // Check whether the counter is ROC_UNSUPPORTED or not.
  static bool isRocUnsupported(const hipCounter &counter);
  // Check whether the counter is DEPRECATED or not.
  static bool isDeprecated(const hipCounter& counter);
  /**
    * Check whether the counter is ROC_UNSUPPORTED/HIP_UNSUPPORTED/UNSUPPORTED or not
    * based on counter's API_TYPE and option TranslateToRoc.
    */
  static bool isUnsupported(const hipCounter &counter);
  //
  static std::string getCudaVersion(const cudaVersions &ver);
  // Set this flag in case of hipification errors
  bool hasErrors = false;
};
