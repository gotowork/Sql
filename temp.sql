---------------------------------------------------------------------------------------------------
-------- this method set a batch to one reception sample analysis ---------------------------------
---------------------------------------------------------------------------------------------------
drop function if exists public.sp_SetBatchToSampleMethod(int8,varchar);
-- select * from public.sp_SetBatchToSampleMethod(0, 'isaac')
CREATE OR REPLACE FUNCTION public.sp_SetBatchToSampleMethod(p_idrecep_sample_detail_elem int8, p_user varchar)
 returns void
AS $$
	declare result integer;
	declare v_num_rep1 int2;
	declare v_num_rep2 int2;
	declare v_num_rep3 int2;
	declare v_num_rep4 int2;
	declare v_num_rep5 int2;
	declare v_num_rep6 int2;
	declare v_num_rep7 int2;
	declare v_num_rep8 int2;
	declare v_cod_repetition int2;
	declare v_num_rep int;
	declare v_idtemplate_method int4;
	declare v_rowcount_batch int2;
	declare v_idbatch bigint;
	declare v_repetition int2;	
	declare v_flag_newbatch boolean;
	declare v_null_idbatch_detail bigint;
	declare v_idbatch_detail_aa bigint;
	declare v_idprocess int2;
	declare v_idprocess_stage int2;
	declare v_idtray int2;
BEGIN	

	v_flag_newbatch = false;
	v_num_rep1 = 1;
	v_num_rep2 = 2;
	v_num_rep3 = 3;
	v_num_rep4 = 4;
	v_num_rep5 = 5;
	v_num_rep6 = 6;
	v_num_rep7 = 7;
	v_num_rep8 = 8;
	v_null_idbatch_detail = 0;

	SELECT INTO v_idtemplate_method idtemplate_method		
	FROM recep_sample_detail_elem
	WHERE idrecep_sample_detail_elem = p_idrecep_sample_detail_elem; --AND status = true;

	-- get process, process_stage and tray from the template method
	SELECT INTO v_idprocess, v_idprocess_stage, v_idtray idprocess, idprocess_stage, idtray 
	FROM template_method_process_stage
	WHERE idtemplate_method = v_idtemplate_method
	ORDER BY order_process_stage limit 1;
	
	-- create a new batch if not exist one available
	v_cod_repetition = (SELECT CASE cod_repetition
					WHEN '-' THEN 0
					WHEN 'SS' THEN 1
					WHEN 'DD' THEN 2
					WHEN 'TT' THEN 3
					WHEN 'LL' THEN 4
					WHEN 'DR' THEN 8
				    END as "cod_repetition"
				FROM recep_sample_detail_elem
				WHERE idrecep_sample_detail_elem = p_idrecep_sample_detail_elem);

	-- recorring each item to assign the batch
	FOR i IN 1..v_cod_repetition LOOP	
		v_idbatch = COALESCE((SELECT idbatch
				FROM batch
				WHERE status_batch = 'P' and idtemplate_method = v_idtemplate_method
				ORDER BY idbatch limit 1), 0);

		IF (v_idbatch = 0) THEN	
			v_idbatch = (SELECT public.sp_GetBatchAvailable(v_idtemplate_method, true));
		END IF;	
			
		IF (v_cod_repetition = 1) THEN		
			-- if exced the size allowed, create a new batch and insert one record	
							
			v_idbatch = (SELECT public.sp_GetBatchAvailable(v_idtemplate_method, false));
			
			-- insert one batch_detail
			v_idbatch_detail_aa = (SELECT public.sp_batch_detail_aa_Insert(v_null_idbatch_detail, v_num_rep1, v_idtemplate_method, p_idrecep_sample_detail_elem, 
					null, null, null, null, null, null, v_idbatch, 'C', p_user, 
					current_date, p_user, current_date, null, true));
					
			-- assign the process for a new template_method
			PERFORM public.sp_batch_detail_process_stage_aa_Insert(v_idbatch_detail_aa, v_idprocess, v_idprocess_stage, v_idtray, v_idbatch, 
										1, null, current_date, null, p_user, current_date, p_user, current_date, true);
				
		ELSIF (v_cod_repetition = 2) THEN
			-- insert two batch_detail in the same batch
			-- (1) --
			v_idbatch = (SELECT public.sp_GetBatchAvailable(v_idtemplate_method, false));
			
			v_idbatch_detail_aa = (SELECT public.sp_batch_detail_aa_Insert(v_null_idbatch_detail, v_num_rep1, v_idtemplate_method, p_idrecep_sample_detail_elem, 
				null, null, null, null, null, null, v_idbatch, 'C', p_user, 
				current_date, p_user, current_date, null, true));
				
			-- assign the process for a new template_method
			PERFORM public.sp_batch_detail_process_stage_aa_Insert(v_idbatch_detail_aa, v_idprocess, v_idprocess_stage, v_idtray, v_idbatch, 
										1, null, current_date, null, p_user, current_date, p_user, current_date, true);	

			-- (2) --
			v_idbatch = (SELECT public.sp_GetBatchAvailable(v_idtemplate_method, false));
			v_idbatch_detail_aa = (SELECT public.sp_batch_detail_aa_Insert(v_null_idbatch_detail, v_num_rep2, v_idtemplate_method, p_idrecep_sample_detail_elem, 
				null, null, null, null, null, null, v_idbatch, 'C', p_user, 
				current_date, p_user, current_date, null, true));
			-- assign the process for a new template_method
			PERFORM public.sp_batch_detail_process_stage_aa_Insert(v_idbatch_detail_aa, v_idprocess, v_idprocess_stage, v_idtray, v_idbatch, 
										1, null, current_date, null, p_user, current_date, p_user, current_date, true);	
								
		ELSIF (v_cod_repetition = 3) THEN
			-- insert thre batch_detail in the same batch
			-- (1) --
			v_idbatch = (SELECT public.sp_GetBatchAvailable(v_idtemplate_method, false));
			v_idbatch_detail_aa = (SELECT public.sp_batch_detail_aa_Insert(v_null_idbatch_detail, v_num_rep1, v_idtemplate_method, p_idrecep_sample_detail_elem, 
				null, null, null, null, null, null, v_idbatch, 'C', p_user, 
				current_date, p_user, current_date, null, true));
			-- assign the process for a new template_method
			PERFORM public.sp_batch_detail_process_stage_aa_Insert(v_idbatch_detail_aa, v_idprocess, v_idprocess_stage, v_idtray, v_idbatch, 
										1, null, current_date, null, p_user, current_date, p_user, current_date, true);	

			-- (2) --
			v_idbatch = (SELECT public.sp_GetBatchAvailable(v_idtemplate_method, false));
			v_idbatch_detail_aa = (SELECT public.sp_batch_detail_aa_Insert(v_null_idbatch_detail, v_num_rep2, v_idtemplate_method, p_idrecep_sample_detail_elem, 
				null, null, null, null, null, null, v_idbatch, 'C', p_user, 
				current_date, p_user, current_date, null, true));
			-- assign the process for a new template_method
			PERFORM public.sp_batch_detail_process_stage_aa_Insert(v_idbatch_detail_aa, v_idprocess, v_idprocess_stage, v_idtray, v_idbatch, 
										1, null, current_date, null, p_user, current_date, p_user, current_date, true);	

			-- (3) --
			v_idbatch = (SELECT public.sp_GetBatchAvailable(v_idtemplate_method, false));
			v_idbatch_detail_aa = (SELECT public.sp_batch_detail_aa_Insert(v_null_idbatch_detail, v_num_rep3, v_idtemplate_method, p_idrecep_sample_detail_elem, 
				null, null, null, null, null, null, v_idbatch, 'C', p_user, 
				current_date, p_user, current_date, null, true));
			-- assign the process for a new template_method
			PERFORM public.sp_batch_detail_process_stage_aa_Insert(v_idbatch_detail_aa, v_idprocess, v_idprocess_stage, v_idtray, v_idbatch, 
										1, null, current_date, null, p_user, current_date, p_user, current_date, true);	
		
		ELSIF (v_cod_repetition = 4) THEN
			-- insert four batch_detail in the same batch
			-- (1) --
			v_idbatch = (SELECT public.sp_GetBatchAvailable(v_idtemplate_method, false));
			v_idbatch_detail_aa = (SELECT public.sp_batch_detail_aa_Insert(v_null_idbatch_detail, v_num_rep1, v_idtemplate_method, p_idrecep_sample_detail_elem, 
				null, null, null, null, null, null, v_idbatch, 'C', p_user, 
				current_date, p_user, current_date, null, true));
			-- assign the process for a new template_method
			PERFORM public.sp_batch_detail_process_stage_aa_Insert(v_idbatch_detail_aa, v_idprocess, v_idprocess_stage, v_idtray, v_idbatch, 
										1, null, current_date, null, p_user, current_date, p_user, current_date, true);	

			-- (2) --
			v_idbatch = (SELECT public.sp_GetBatchAvailable(v_idtemplate_method, false));
			v_idbatch_detail_aa = (SELECT public.sp_batch_detail_aa_Insert(v_null_idbatch_detail, v_num_rep2, v_idtemplate_method, p_idrecep_sample_detail_elem, 
				null, null, null, null, null, null, v_idbatch, 'C', p_user, 
				current_date, p_user, current_date, null, true));
			-- assign the process for a new template_method
			PERFORM public.sp_batch_detail_process_stage_aa_Insert(v_idbatch_detail_aa, v_idprocess, v_idprocess_stage, v_idtray, v_idbatch, 
										1, null, current_date, null, p_user, current_date, p_user, current_date, true);	
				
			-- insert in diferent batch
			-- (3) --
			v_idbatch = (SELECT public.sp_GetBatchAvailable(v_idtemplate_method, true));
			v_idbatch_detail_aa = (SELECT public.sp_batch_detail_aa_Insert(v_null_idbatch_detail, v_num_rep3, v_idtemplate_method, p_idrecep_sample_detail_elem, 
				null, null, null, null, null, null, v_idbatch, 'C', p_user, 
				current_date, p_user, current_date, null, true));
			-- assign the process for a new template_method
			PERFORM public.sp_batch_detail_process_stage_aa_Insert(v_idbatch_detail_aa, v_idprocess, v_idprocess_stage, v_idtray, v_idbatch, 
										1, null, current_date, null, p_user, current_date, p_user, current_date, true);	

			-- (4) --
			v_idbatch = (SELECT public.sp_GetBatchAvailable(v_idtemplate_method, false));
			v_idbatch_detail_aa = (SELECT public.sp_batch_detail_aa_Insert(v_null_idbatch_detail, v_num_rep4, v_idtemplate_method, p_idrecep_sample_detail_elem, 
				null, null, null, null, null, null, v_idbatch, 'C', p_user, 
				current_date, p_user, current_date, null, true));
			-- assign the process for a new template_method
			PERFORM public.sp_batch_detail_process_stage_aa_Insert(v_idbatch_detail_aa, v_idprocess, v_idprocess_stage, v_idtray, v_idbatch, 
										1, null, current_date, null, p_user, current_date, p_user, current_date, true);	

		ELSIF (v_cod_repetition = 8) THEN
			-- insert eight batch_detail in the same batch
			-- (1) --
			v_idbatch = (SELECT public.sp_GetBatchAvailable(v_idtemplate_method, false));
			v_idbatch_detail_aa = (SELECT public.sp_batch_detail_aa_Insert(v_null_idbatch_detail, v_num_rep1, v_idtemplate_method, p_idrecep_sample_detail_elem, 
				null, null, null, null, null, null, v_idbatch, 'C', p_user, 
				current_date, p_user, current_date, null, true));
			-- assign the process for a new template_method
			PERFORM public.sp_batch_detail_process_stage_aa_Insert(v_idbatch_detail_aa, v_idprocess, v_idprocess_stage, v_idtray, v_idbatch, 
										1, null, current_date, null, p_user, current_date, p_user, current_date, true);	

			-- (2) --
			v_idbatch = (SELECT public.sp_GetBatchAvailable(v_idtemplate_method, false));
			v_idbatch_detail_aa = (SELECT public.sp_batch_detail_aa_Insert(v_null_idbatch_detail, v_num_rep2, v_idtemplate_method, p_idrecep_sample_detail_elem, 
				null, null, null, null, null, null, v_idbatch, 'C', p_user, 
				current_date, p_user, current_date, null, true));
			-- assign the process for a new template_method
			PERFORM public.sp_batch_detail_process_stage_aa_Insert(v_idbatch_detail_aa, v_idprocess, v_idprocess_stage, v_idtray, v_idbatch, 
										1, null, current_date, null, p_user, current_date, p_user, current_date, true);	

			-- (3) --
			v_idbatch = (SELECT public.sp_GetBatchAvailable(v_idtemplate_method, false));
			v_idbatch_detail_aa = (SELECT public.sp_batch_detail_aa_Insert(v_null_idbatch_detail, v_num_rep3, v_idtemplate_method, p_idrecep_sample_detail_elem, 
				null, null, null, null, null, null, v_idbatch, 'C', p_user, 
				current_date, p_user, current_date, null, true));
			-- assign the process for a new template_method
			PERFORM public.sp_batch_detail_process_stage_aa_Insert(v_idbatch_detail_aa, v_idprocess, v_idprocess_stage, v_idtray, v_idbatch, 
										1, null, current_date, null, p_user, current_date, p_user, current_date, true);	

			-- (4) --
			v_idbatch = (SELECT public.sp_GetBatchAvailable(v_idtemplate_method, false));
			v_idbatch_detail_aa = (SELECT public.sp_batch_detail_aa_Insert(v_null_idbatch_detail, v_num_rep4, v_idtemplate_method, p_idrecep_sample_detail_elem, 
				null, null, null, null, null, null, v_idbatch, 'C', p_user, 
				current_date, p_user, current_date, null, true));
			-- assign the process for a new template_method
			PERFORM public.sp_batch_detail_process_stage_aa_Insert(v_idbatch_detail_aa, v_idprocess, v_idprocess_stage, v_idtray, v_idbatch, 
										1, null, current_date, null, p_user, current_date, p_user, current_date, true);	

			-- insert in other batch	
			-- (5) --
			v_idbatch = (SELECT public.sp_GetBatchAvailable(v_idtemplate_method, true));
			v_idbatch_detail_aa = (SELECT public.sp_batch_detail_aa_Insert(v_null_idbatch_detail, v_num_rep5, v_idtemplate_method, p_idrecep_sample_detail_elem, 
				null, null, null, null, null, null, v_idbatch, 'C', p_user, 
				current_date, p_user, current_date, null, true));
			-- assign the process for a new template_method
			PERFORM public.sp_batch_detail_process_stage_aa_Insert(v_idbatch_detail_aa, v_idprocess, v_idprocess_stage, v_idtray, v_idbatch, 
										1, null, current_date, null, p_user, current_date, p_user, current_date, true);	

			-- (6) --
			v_idbatch = (SELECT public.sp_GetBatchAvailable(v_idtemplate_method, true));
			v_idbatch_detail_aa = (SELECT public.sp_batch_detail_aa_Insert(v_null_idbatch_detail, v_num_rep6, v_idtemplate_method, p_idrecep_sample_detail_elem, 
				null, null, null, null, null, null, v_idbatch, 'C', p_user, 
				current_date, p_user, current_date, null, true));
			-- assign the process for a new template_method
			PERFORM public.sp_batch_detail_process_stage_aa_Insert(v_idbatch_detail_aa, v_idprocess, v_idprocess_stage, v_idtray, v_idbatch, 
										1, null, current_date, null, p_user, current_date, p_user, current_date, true);	

			-- (7) --
			v_idbatch = (SELECT public.sp_GetBatchAvailable(v_idtemplate_method, true));
			v_idbatch_detail_aa = (SELECT public.sp_batch_detail_aa_Insert(v_null_idbatch_detail, v_num_rep7, v_idtemplate_method, p_idrecep_sample_detail_elem, 
				null, null, null, null, null, null, v_idbatch, 'C', p_user, 
				current_date, p_user, current_date, null, true));
			-- assign the process for a new template_method
			PERFORM public.sp_batch_detail_process_stage_aa_Insert(v_idbatch_detail_aa, v_idprocess, v_idprocess_stage, v_idtray, v_idbatch, 
										1, null, current_date, null, p_user, current_date, p_user, current_date, true);	

			-- (8) --
			v_idbatch = (SELECT public.sp_GetBatchAvailable(v_idtemplate_method, true));
			v_idbatch_detail_aa = (SELECT public.sp_batch_detail_aa_Insert(v_null_idbatch_detail, v_num_rep8, v_idtemplate_method, p_idrecep_sample_detail_elem, 
				null, null, null, null, null, null, v_idbatch, 'C', p_user, 
				current_date, p_user, current_date, null, true));
			-- assign the process for a new template_method
			PERFORM public.sp_batch_detail_process_stage_aa_Insert(v_idbatch_detail_aa, v_idprocess, v_idprocess_stage, v_idtray, v_idbatch, 
										1, null, current_date, null, p_user, current_date, p_user, current_date, true);	
		END IF;
		
	END LOOP;		

END;
$$ LANGUAGE plpgsql;