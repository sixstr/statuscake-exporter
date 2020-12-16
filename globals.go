package main

import (
	"github.com/prometheus/client_golang/prometheus"
	"github.com/sixstr/statuscake-exporter/collector"
	"github.com/sixstr/statuscake-exporter/stk"
)

type globalConf struct {
	listenAddress  string
	metricsPath    string
	version        string
	versionCm      string
	versionTag     string
	versionEnv     string
	StkUsername    string
	StkApikey      string
	StkTags        string
	StkInterval    int
	Resolution     int
	StkEnableTests bool
	StkEnableSSL   bool
	StkSSLFlags    string
}

type globalProm struct {
	MC        *collector.MasterCollector
	Registry  *prometheus.Registry
	Gatherers *prometheus.Gatherers
}

const (
	exporterName        = "statuscake_exporter"
	exporterDescription = "StatusCake Exporter"
	defaultInterval     = 300
	defaultResolution   = 30
)

var (
	// VersionCommit is a compiler exporterd var
	VersionCommit string
	VersionTag    string
	VersionFull   string
	VersionEnv    string

	// Global vars
	config = globalConf{
		":9190",
		"/metrics",
		VersionFull,
		VersionCommit,
		VersionTag,
		VersionEnv,
		"",
		"",
		"",
		defaultInterval,
		defaultResolution,
		false,
		false,
		"",
	}
	stkAPI *stk.StkAPI
	prom   globalProm
)
