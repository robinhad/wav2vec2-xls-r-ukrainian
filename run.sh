#!/usr/bin/env bash
python run_speech_recognition_ctc.py \
	--dataset_name="common_voice" \
	--model_name_or_path="facebook/wav2vec2-xls-r-300m" \
	--dataset_config_name="uk" \
	--output_dir="./wav2vec2-xls-r-common_voice-uk-ft" \
	--overwrite_output_dir \
	--num_train_epochs="100" \
	--per_device_train_batch_size="8" \
	--per_device_eval_batch_size="4" \
	--gradient_accumulation_steps="1" \
	--learning_rate="5e-4" \
	--warmup_steps="500" \
	--evaluation_strategy="steps" \
	--text_column_name="sentence" \
	--save_steps="500" \
	--eval_steps="500" \
	--logging_steps="25" \
	--layerdrop="0.0" \
	--eval_metrics wer cer \
	--save_total_limit="1" \
	--mask_time_prob="0.3" \
	--mask_time_length="10" \
	--mask_feature_prob="0.1" \
	--mask_feature_length="64" \
	--freeze_feature_extractor \
	--chars_to_ignore , ? . ! - \; \: \" “ % ‘ ” � \
	--fp16 \
	--group_by_length \
	--do_train --do_eval \
	--gradient_checkpointing 
