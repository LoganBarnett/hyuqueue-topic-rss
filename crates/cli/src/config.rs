use hyuqueue_topic_rss_lib::{LogFormat, LogLevel};
use rust_template_foundation::MergeConfig;

#[derive(Debug, Clone, MergeConfig)]
#[merge_config(app_name = "hyuqueue-topic-rss")]
pub struct Config {
  #[merge_config(common)]
  pub log_level: LogLevel,
  #[merge_config(common)]
  pub log_format: LogFormat,
  /// Name to greet.
  #[merge_config(short, default = "\"World\".to_string()")]
  pub name: String,
}
